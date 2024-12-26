import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _enteredEmail = '';
  String _enteredPassword = '';
  bool _isAuthenticated = false;

  String get enteredEmail => _enteredEmail;
  String get enteredPassword => _enteredPassword;
  bool get isAuthenticated => _isAuthenticated;

  set enteredEmail(String email) {
    _enteredEmail = email;
    notifyListeners();
  }

  set enteredPassword(String password) {
    _enteredPassword = password;
    notifyListeners();
  }

  // Fungsi untuk login
  Future<void> submit() async {
    try {
      // Simulasi login dengan kondisi email dan password
      if (_enteredEmail == 'nutrismart@gmail.com' &&
          _enteredPassword == '123456') {
        _isAuthenticated = true; // Login berhasil
      } else {
        _isAuthenticated = false; // Login gagal
      }
      notifyListeners(); // Memberitahu listener untuk memperbarui status
    } catch (error) {
      _isAuthenticated = false;
      notifyListeners();
      throw Exception('Login failed: $error');
    }
  }
}
