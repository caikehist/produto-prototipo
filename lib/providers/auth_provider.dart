import 'package:flutter/material.dart';
import '../database/database.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  bool get isProfessor => _currentUser?.role == 'PROFESSOR_ORGANIZADOR';
  bool get isAuthenticated => _currentUser != null;

  Future<bool> login(String username, String password, AppDatabase db) async {
    final user = await db.validateUser(username, password);
    if (user != null) {
      _currentUser = user;
      await db.logAction(user.id, 'LOGIN');
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}