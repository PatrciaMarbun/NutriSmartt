import 'package:flutter/material.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profile.dart';
import 'package:program/page/auth/setting.dart';
import 'package:program/page/auth/appoitment.dart';

class PossibleDiseasescreen extends StatefulWidget {
  final Map<String, dynamic> diagnosis;

  PossibleDiseasescreen({required this.diagnosis});

  @override
  _PossibleDiseasescreenState createState() => _PossibleDiseasescreenState();
}

class _PossibleDiseasescreenState extends State<PossibleDiseasescreen> {
  int _selectedIndex = 2; // Default to Home tab (index 2)

  void _onItemTapped(int index) {
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
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  void _onNotificationTapped() {
    print("Notification icon tapped!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengubah background menjadi putih
      appBar: AppBar(
        backgroundColor:
            Colors.green[300], // Update AppBar background color to green[300]
        title: Text("Possible Disease", style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, size: 26, color: Colors.black),
            onPressed: _onNotificationTapped,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Make the container background green to merge with AppBar
            Container(
              color: Colors.white, // Same green color as AppBar
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/ivan.png'),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Alexa',
                        style: TextStyle(
                          color: Colors
                              .black, // White text to contrast with the green background
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Patient',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),

            // Diagnosis and suggestions sections (no color change here)
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diagnosis: ${widget.diagnosis['keluhan']}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Penyakit yang Mungkin Terjadi:',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  ...widget.diagnosis['penyakit']
                      .map((penyakit) =>
                          Text('- $penyakit', style: TextStyle(fontSize: 13)))
                      .toList(),
                  SizedBox(height: 15),
                  Text(
                    'Nutrisi yang Disarankan:',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  ...widget.diagnosis['nutrisi']
                      .map((nutrisi) =>
                          Text('- $nutrisi', style: TextStyle(fontSize: 13)))
                      .toList(),
                ],
              ),
            ),
            SizedBox(height: 18),

            // Button for navigating to AppointmentsScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentsScreen()),
                );
              },
              child: Text('Contact Nutritionist'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                foregroundColor: const Color.fromARGB(255, 252, 247, 247),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 26, color: Colors.black),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, size: 26, color: Colors.black),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 26, color: Colors.black),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 26, color: Colors.black),
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
}
