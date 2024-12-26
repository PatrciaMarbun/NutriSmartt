import 'package:flutter/material.dart';
import 'package:program/page/auth/list.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profiledoktor.dart';
import 'package:program/page/auth/pasiennotif.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/setting.dart';
import 'package:program/page/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorHome(),
    );
  }
}

class DoctorHome extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DoctorHome> {
  int _selectedIndex = 0;
  TextEditingController _textController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan indeks
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Groupchat()),
        );
        break;
      case 2:
        // Tetap di halaman Home, tidak perlu navigasi
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoktorProfile()),
        );
        break;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.black), // Ikon exit
            onPressed: () {
              // Tindakan untuk logout atau keluar dari aplikasi
              // Mengarahkan ke halaman utama pengguna (misalnya HomePage)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        UserPage()), // Ganti dengan halaman utama pengguna
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan avatar dan sapaan
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profill.png'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Nutrion',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Have a nice day',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Bagian "Manage Packages"
            Text(
              'My Aplication',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: -0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Card 1: Article
                Container(
                  width: 120,
                  height: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/objek.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Article',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Card 2: Article
                Container(
                  width: 120,
                  height: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/pil.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Nutrion',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Card 3: Article
                Container(
                  width: 120,
                  height: 100,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/promag.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Reports',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Teks "History Patient" di atas box
            Text(
              'History Patient',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Teks Pasien dalam satu box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Teks Pasien 1
                  Text(
                    'Nama Pasien: John Doe   Usia: 35 tahun   Jenis Kelamin: Laki-laki   Diagnosis: Diabetes Tipe 2   Tanggal Konsultasi: 1 Desember 2024   Rekomendasi Nutrisi: Diet rendah karbohidrat, tinggi serat   Tindak Lanjut: Konsultasi ulang 10 Desember 2024',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.black), // Garis horizontal pemisah
                  SizedBox(height: 16),
                  // Teks Pasien 2
                  Text(
                    'Nama Pasien: Jane Roe   Usia: 28 tahun   Jenis Kelamin: Perempuan   Diagnosis: Hipertensi   Tanggal Konsultasi: 2 Desember 2024   Rekomendasi Nutrisi: Diet rendah garam, tinggi kalium   Tindak Lanjut: Konsultasi ulang 12 Desember 2024',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25), // Memberikan jarak setelah box
            // Upcoming Appointments Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Patient List',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(),
                      ),
                    );
                  },
                  child: Text('See all'),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Appointment Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/ivan.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mr. Ivan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '05 Nov, 2024',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('View Appointment',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30, color: Colors.black),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, size: 30, color: Colors.black),
            label: 'Group Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 30, color: Colors.black),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green[300],
      ),
    );
  }
}
