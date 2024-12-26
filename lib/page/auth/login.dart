import 'package:flutter/material.dart';
import 'package:program/page/auth/sigup.dart';
import 'package:provider/provider.dart';
import 'package:program/page/auth/home.dart';
import 'package:program/provider/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'EMAIL',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) {
                    authProvider.enteredEmail = value;
                  },
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    authProvider.enteredPassword = value;
                  },
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text('Forgot Password?',
                        style: TextStyle(color: Colors.black54)),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    ),
                    onPressed: () async {
                      try {
                        // Menunggu proses login selesai
                        await authProvider.submit();

                        // Memeriksa status autentikasi setelah submit
                        if (authProvider.isAuthenticated) {
                          // Jika login berhasil
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } else {
                          // Jika login gagal
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Login failed"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      } catch (error) {
                        // Menangani error
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Error: ${error.toString()}"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Text('LOGIN',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
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
                    'Log in with',
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
                        radius: 32,
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          icon: Image.asset('assets/icons/facebook.png'),
                          iconSize: 20,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(color: Color(0xFF006400)),
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
      },
    );
  }
}
