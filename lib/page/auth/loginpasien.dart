import 'package:flutter/material.dart';
import 'package:program/page/auth/doktorhome.dart';
import 'package:program/page/auth/forgotpasien.dart';
import 'package:program/page/auth/register.dart';

class LoginPasienPage extends StatelessWidget {
  const LoginPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Menavigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'EMAIL',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'email@gmail.com',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility_off_outlined),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Navigasi ke ForgotPasswordPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Forgotpasien()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // Membuat tombol bulat
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
                onPressed: () {
                  // Navigasi ke halaman IvanPage setelah login berhasil
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DoctorHome()), // Ganti dengan halaman yang sesuai
                  );
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'LOG in with',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      icon: Image.asset('assets/icons/google.png'),
                      iconSize: 24,
                      onPressed: () {
                        // Aksi untuk login dengan Google
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      icon: Image.asset('assets/icons/apple.png'),
                      iconSize: 24,
                      onPressed: () {
                        // Aksi untuk login dengan Apple
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      icon: Image.asset('assets/icons/facebook.png'),
                      iconSize: 24,
                      onPressed: () {
                        // Aksi untuk login dengan Facebook
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () {
                  // Aksi untuk "Register now" - navigasi ke Register page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: 'Register now',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
