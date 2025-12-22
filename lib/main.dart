import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/database.dart';
import 'providers/auth_provider.dart';
import 'ui/auth/login_screen.dart';
import 'ui/student/student_dashboard.dart';
import 'ui/teacher/teacher_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  await database.seedDatabase();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>(create: (_) => database, dispose: (_, db) => db.close()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const PatrimonioApp(),
    ),
  );
}

class PatrimonioApp extends StatelessWidget {
  const PatrimonioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrimônio Narrativo',
      theme: ThemeData(primarySwatch: Colors.brown, useMaterial3: true),
      home: const LoginScreen(),
      routes: {
        '/professor': (context) => const TeacherDashboard(),
        '/student': (context) => const StudentDashboard(),
      },
    );
  }
}