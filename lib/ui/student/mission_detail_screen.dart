import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import '../../database/database.dart';
import '../../providers/auth_provider.dart';

class MissionDetailScreen extends StatefulWidget {
  final Mission mission;
  const MissionDetailScreen({super.key, required this.mission});
  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final ImagePicker _picker = ImagePicker();
  bool _isRecording = false;

  @override
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  // --- LÓGICA DE LOCALIZAÇÃO COM ESPERA ATIVA ---
  Future<Position?> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // Se o GPS estiver desligado, entramos no loop de espera
    if (!serviceEnabled) {
      if (mounted) {
        bool? goToSettings = await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("GPS Desativado"),
            content: const Text(
              "Para registrar o artefato, você precisa ativar o GPS nas configurações.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text("Ativar agora"),
              ),
            ],
          ),
        );

        if (goToSettings == true) {
          await Geolocator.openLocationSettings();

          // Exibir tela de espera enquanto o usuário não ativa
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 15),
                        Text("Aguardando ativação do GPS..."),
                        Text(
                          "Ative o GPS e volte para o app.",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );

            // Loop de verificação (Polling): verifica a cada 1 segundo se o GPS ligou
            int attempts = 0;
            while (!serviceEnabled && attempts < 30) {
              // Tenta por 30 segundos
              await Future.delayed(const Duration(seconds: 1));
              serviceEnabled = await Geolocator.isLocationServiceEnabled();
              attempts++;
            }

            Navigator.pop(context); // Fecha o diálogo de espera
          }
        }
      }

      if (!serviceEnabled)
        return null; // Se após 30s ainda estiver off, desiste
    }

    // Verificação de Permissões
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    // Busca a coordenada real
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => const Center(child: CircularProgressIndicator()),
      );
    }

    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      position = await Geolocator.getLastKnownPosition();
    }

    if (mounted) Navigator.pop(context); // Fecha o loading da coordenada
    return position;
  }

  // --- CAPTURA E SELEÇÃO ---
  Future<void> _captureMedia(String type) async {
    XFile? file;
    try {
      if (type == 'PHOTO')
        file = await _picker.pickImage(source: ImageSource.camera);
      else if (type == 'VIDEO')
        file = await _picker.pickVideo(source: ImageSource.camera);
      if (file != null) {
        Position? pos = await _getLocation();
        if (mounted) _showMetadataDialog(file.path, type, pos);
      }
    } catch (e) {
      debugPrint("Erro: $e");
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      Position? pos = await _getLocation();
      String path = result.files.single.path!;
      String ext = p.extension(path).toLowerCase();
      String type = (['.jpg', '.png', '.jpeg'].contains(ext))
          ? 'PHOTO'
          : (['.mp4', '.mov'].contains(ext) ? 'VIDEO' : 'AUDIO');
      if (mounted) _showMetadataDialog(path, type, pos);
    }
  }

  Future<void> _toggleAudioRecording() async {
    if (_isRecording) {
      final path = await _audioRecorder.stop();
      setState(() => _isRecording = false);
      if (path != null) {
        Position? pos = await _getLocation();
        if (mounted) _showMetadataDialog(path, 'AUDIO', pos);
      }
    } else if (await _audioRecorder.hasPermission()) {
      final directory = await getApplicationDocumentsDirectory();
      final path = p.join(
        directory.path,
        'temp_${DateTime.now().millisecondsSinceEpoch}.m4a',
      );
      await _audioRecorder.start(const RecordConfig(), path: path);
      setState(() => _isRecording = true);
    }
  }

  // --- FORMULÁRIO DE METADADOS ---
  Future<void> _showMetadataDialog(
    String tempPath,
    String type,
    Position? pos,
  ) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final authorCtrl = TextEditingController();
    final latCtrl = TextEditingController(text: pos?.latitude.toString() ?? "");
    final lngCtrl = TextEditingController(
      text: pos?.longitude.toString() ?? "",
    );
    DateTime  originalDate;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => AlertDialog(
          title: Text("Novo Artefato ($type)"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: "Título *"),
                ),
                TextField(
                  controller: authorCtrl,
                  decoration: const InputDecoration(
                    labelText: "Autor Original (opcional)",
                  ),
                ),
                TextField(
                  controller: descCtrl,
                  decoration: const InputDecoration(labelText: "Detalhes"),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                Row(
                  children: [
                    const Text("Data da Obra: "),
                    TextButton( sync {
                        final d = await showDatePicker(
                          context: context,
                          initialDate: originalDate ?? DateTime.now(),
                          firstDate: DateTime(1800),
                          lastDate: Da 
                        if (d != null) setModalState(() => originalDate = d);
                      },
                      child: Text(originalDate == null
                          ? "Selecionar (opcional)"
                          : "${originalDate!.day}/${originalDate!.month}/${originalDate!.year}"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Data de Registro: "),
                    TextButton(
                      onPressed: () async {
                        final d = await showDatePicker(
                          context: context,
                          initialDate: registrationDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (d != null)
                          setModalState(() => registrationDate = d);
                      },
                      child: Text(nDate.day}/${registrationDate.month}/${registrationDate.year}",
                      ),
                    ),
                  ],
                const Divider(),
                const Text(
                  "Coordenadas GPS",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: latCtrl,
                        decoration: const InputDecoration(labelText: "Lat"),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: lngCtrl,
                        decoration: const InputDecoration(labelText: "Lng"),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (titleCtrl.text.isEmpty) return;
                await _saveArtifact(
                  tempPath,
                  type,
                  titleCtrl.text,
                  descCtrl.text,
                  authorCtrl.text,
                  registrationDate,
                  originalDate,
                  double.tryParse(latCtrl.text),
                  double.tryParse(lngCtrl.text),
                );pcontext);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveArtifact(
    String tempPath,
    String type,
    String title,
    String desc,
    String author,
    DateTime registrationDate,
    DateTime? originalDate,
    double? lat,
    double? lng,
  ) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    final autectory = await getApplicationDocumentsDirectory();
    final savedPath = p.join(
      directory.path,
      '${type.toLowerCase()}_${DateTime.now().millisecondsSinceEpoch}${p.extension(tempPath)}',
    );
    try {
      await File(tempPath).copy(savedPath);
      await db
          .into(db.artifacts)
          .insert(
            ArtifactsCompanion.insert(
              missionId: widget.mission.id,
              userId: auth.currentUser!.id,
              type: type,
              filePath: savedPath,
              title: title,
              description: d.Value(desc),
              registeredBy: author,
              registrationDate: registrationDate,
              originalDate: d.Value(originalDate),
              latitude: d.Value(lat),
              longitude: d.Value(lng),
            ),
          );
    } catch (e) {
      debugPrint("Erro: $e");
  }

  // --- EXCLUSÃO E PLAY ---
  Future<void> _delete(Artifact item) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    if (await File(item.filePath).exists()) await File(item.filePath).delete();
    await db.deleteArtifact(item.id);
  }

  void _play(Artifact item) {
    if (item.type == 'PHOTO')
      showDialog(
        context: context,
        builder: (_) => Dialog(child: Image.file(File(item.filePath))),
      );
    else if (item.type == 'AUDIO') {
      _audioPlayer.stop();
      _audioPlayer.play(DeviceFileSource(item.filePath));
    } else if (item.type == 'VIDEO')
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(path: item.filePath),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.mission.title)),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.brown.shade50,
            child: Text(widget.mission.description),
          ),
          Expanded(
            child: StreamBuilder<List<Artifact>>(
              stream: (db.select(
                db.artifacts,
              )..where((t) => t.missionId.equals(widget.mission.id))).watch(),
              builder: (context, snapshot) {
                final list = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final item = list[i];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: ListTile(
                        leading: Icon(
                          item.type == 'PHOTO'
                              ? Icons.image
                              : item.type == 'AUDIO'
                              ? Icons.mic
                              : Icons.videocam,
                          color: Colors.brown,
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Builder(builder: (context) {
                          final subtitles = <String>[];
                          if (item.registeredBy.isNotEmpty) {
                            subtitles.add("Autor Original: ${item.registeredBy}");
                          }
                          if (item.originalDate != null) {
                            subtitles.add(
                         
                          return Text(subtitles.join(' | '));
                        }),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.play_circle_outline),
                              onPressed: () => _play(item),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () => _delete(item),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _buildPanel(),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      color: Colors.brown.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _btn(Icons.camera_alt, "Foto", () => _captureMedia('PHOTO')),
          _btn(
            _isRecording ? Icons.stop : Icons.mic,
            _isRecording ? "Parar" : "Áudio",
            _toggleAudioRecording,
            color: _isRecording ? Colors.red : null,
          ),
          _btn(Icons.videocam, "Vídeo", () => _captureMedia('VIDEO')),
          _btn(Icons.file_upload, "Arquivo", _pickFile),
        ],
      ),
    );
  }

  Widget _btn(IconData icon, String label, VoidCallback onTap, {Color? color}) {
    return Column(
      children: [
        IconButton.filledTonal(
          onPressed: onTap,
          icon: Icon(icon, color: color),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String path;
  const VideoPlayerScreen({super.key, required this.path});
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {});
        _ctrl.play();
      });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _ctrl.value.isInitialized
            ? AspectRatio(
                aspectRatio: _ctrl.value.aspectRatio,
                child: VideoPlayer(_ctrl),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: _ctrl.value.isInitialized
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _ctrl.value.isPlaying ? _ctrl.pause() : _ctrl.play();
                });
              },
              child: Icon(
                _ctrl.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
