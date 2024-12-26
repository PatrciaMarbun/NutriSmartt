import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:program/page/auth/login.dart'; // Import halaman login

class SignUpScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 221, 246, 221), // Warna hijau muda sebagai latar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke layar sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Posisikan ke atas
          children: [
            SizedBox(height: 40), // Menambahkan jarak agar tidak terlalu atas
            Text(
              "SIGNUP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            _buildTextField(
                context, _firstNameController, "First Name", Icons.person),
            SizedBox(height: 16),
            _buildTextField(
                context, _lastNameController, "Last Name", Icons.person),
            SizedBox(height: 16),
            _buildTextField(context, _emailController, "Email", Icons.email),
            SizedBox(height: 16),
            _buildTextField(
                context, _passwordController, "Password", Icons.lock,
                isPassword: true),
            SizedBox(height: 16),
            _buildTextField(context, _confirmPasswordController,
                "Confirm Password", Icons.lock,
                isPassword: true),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final confirmPassword = _confirmPasswordController.text;

                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Passwords do not match!"),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    try {
                      // Mendaftarkan pengguna dengan Firebase
                      await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // Berhasil, navigasi ke halaman login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } catch (e) {
                      // Gagal mendaftar
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Failed to sign up: ${e.toString()}"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 77, 187, 81),
                        width: 2),
                  ),
                ),
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    TextEditingController controller,
    String labelText,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      readOnly: true,
      onTap: () async {
        String? result = await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Enter $labelText"),
              content: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, controller.text),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        if (result != null && result.isNotEmpty) {
          controller.text = result;
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
