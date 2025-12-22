import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/database.dart';
import '../../providers/auth_provider.dart';
import 'mission_detail_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas Missões"),
        actions: [IconButton(onPressed: () => auth.logout(), icon: const Icon(Icons.exit_to_app))],
      ),
      body: StreamBuilder<List<Mission>>(
        stream: db.select(db.missions).watch(),
        builder: (context, snapshot) {
          final missions = snapshot.data ?? [];
          if (missions.isEmpty) return const Center(child: Text("Nenhuma missão atribuída."));
          
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: missions.length,
            itemBuilder: (context, index) {
              final m = missions[index];
              return Card(
                child: ListTile(
                  title: Text(m.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(m.description),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MissionDetailScreen(mission: m))),
                ),
              );
            },
          );
        },
      ),
    );
  }
}