import 'package:flutter/material.dart';
import 'package:program/page/auth/appoitment.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profiledoktor.dart';
import 'package:program/page/auth/rekoomen.dart';
import 'package:program/page/auth/setting.dart';

class PossibleDiseasePage extends StatefulWidget {
  @override
  _PossibleDiseasePageState createState() => _PossibleDiseasePageState();
}

class _PossibleDiseasePageState extends State<PossibleDiseasePage> {
  int _selectedIndex = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Aksi untuk notifikasi
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian atas hijau
          Container(
            color: Colors.green,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/ivan.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Alexa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Patient',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bagian bawah putih
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildDiseaseCard(
                    'Iron Deficiency Anemia',
                    'A lack of iron leads to low hemoglobin production, causing fatigue, paleness, and shortness of breath. It is often due to insufficient iron intake or blood loss.',
                  ),
                  const SizedBox(height: 16),
                  _buildDiseaseCard(
                    'Folate Deficiency Anemia',
                    'Insufficient folic acid reduces red blood cell production, causing fatigue and shortness of breath. Common in pregnant women and those with poor diets or absorption problems.',
                  ),
                  const SizedBox(height: 16),
                  _buildDiseaseCard(
                    'Anemia of Chronic Disease',
                    'Chronic illness or inflammation interferes with iron usage, leading to low hemoglobin levels. Symptoms include fatigue and weakness, despite normal or elevated iron stores.',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppointmentsScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Contact Nutritionist',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              // Navigasi ke halaman Recommended Nutrients
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Rekoomen(), // Pindah ke halaman Rekoomen
                                ),
                              );
                            },
                            child: Text(
                              'Recommended Nutrients',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30, color: Colors.black),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, size: 30, color: Colors.black),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 30, color: Colors.black),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildDiseaseCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
