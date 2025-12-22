import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/database.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Patrimônio Narrativo", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.brown)),
            const SizedBox(height: 40),
            TextField(controller: _userController, decoration: const InputDecoration(labelText: "Usuário")),
            TextField(controller: _passController, decoration: const InputDecoration(labelText: "Senha"), obscureText: true),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () async {
                bool success = await auth.login(_userController.text, _passController.text, db);
                if (success) {
                  Navigator.pushReplacementNamed(context, auth.isProfessor ? '/professor' : '/student');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Credenciais inválidas")));
                }
              },
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}