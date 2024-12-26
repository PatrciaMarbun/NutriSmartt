import 'package:flutter/material.dart';
import 'package:program/page/auth/PossibleDisease.dart';
import 'package:program/page/auth/appoitment.dart';
import 'package:program/page/auth/drugs.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profile.dart';
import 'package:program/page/auth/notification.dart';
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
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.green[300],
        colorScheme: ColorScheme.light(
          primary: Colors.green[300]!, // primary color
          secondary: Colors.green[600]!, // secondary color
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _textController = TextEditingController();

  final List<Map<String, dynamic>> dataset = [
    {
      "keluhan":
          "Saya sering merasa sakit kepala yang sangat menyakitkan, terutama di satu sisi kepala saya.",
      "penyakit": [
        "Migrain: Sakit kepala parah yang biasanya terjadi di satu sisi kepala.",
        "Sinusitis: Peradangan pada sinus yang menyebabkan sakit kepala dan tekanan di wajah.",
        "Hipertensi: Tekanan darah tinggi yang dapat menyebabkan sakit kepala.",
        "Dehidrasi: Kekurangan cairan dalam tubuh yang dapat menyebabkan sakit kepala.",
        "Tumor Otak: Pertumbuhan sel abnormal di otak yang dapat menyebabkan sakit kepala."
      ],
      "nutrisi": [
        "Konsumsi makanan kaya magnesium seperti kacang-kacangan dan sayuran hijau.",
        "Minum banyak air.",
        "Hindari makanan tinggi garam.",
        "Konsumsi buah-buahan kaya vitamin C seperti jeruk dan kiwi.",
        "Konsumsi makanan rendah lemak jenuh seperti ikan dan sayuran."
      ]
    },
    {
      "keluhan":
          "Saya merasa mual dan perut saya terasa kembung setelah makan makanan berat.",
      "penyakit": [
        "Gastritis: Peradangan pada lapisan perut yang menyebabkan rasa mual.",
        "GERD (Gastroesophageal Reflux Disease): Refluks asam lambung yang menyebabkan mual.",
        "Dispepsia: Gangguan pencernaan yang menyebabkan rasa tidak nyaman di perut.",
        "Intoleransi Laktosa: Ketidakmampuan tubuh untuk mencerna laktosa yang menyebabkan kembung.",
        "Infeksi Saluran Pencernaan: Infeksi bakteri atau virus yang menyebabkan gangguan pencernaan."
      ],
      "nutrisi": [
        "Hindari makanan berlemak dan pedas.",
        "Konsumsi makanan yang mudah dicerna seperti nasi putih dan sup kaldu.",
        "Minum teh jahe untuk meredakan mual.",
        "Konsumsi makanan kaya probiotik seperti yogurt.",
        "Makan dalam porsi kecil namun sering."
      ]
    },
    {
      "keluhan":
          "Saya sering merasa sesak napas setelah beraktivitas ringan seperti naik tangga.",
      "penyakit": [
        "Asma: Gangguan pernapasan yang menyebabkan sesak napas.",
        "Penyakit Jantung: Masalah pada jantung yang dapat menyebabkan sesak napas.",
        "Pneumonia: Infeksi paru-paru yang menyebabkan kesulitan bernapas.",
        "Emboli Paru: Penyumbatan arteri paru-paru yang menyebabkan sesak napas.",
        "COPD (Chronic Obstructive Pulmonary Disease): Penyakit paru-paru kronis yang menyebabkan sesak napas."
      ],
      "nutrisi": [
        "Konsumsi makanan kaya antioksidan seperti beri dan sayuran hijau.",
        "Hindari konsumsi makanan yang memicu peradangan, seperti makanan olahan.",
        "Konsumsi makanan kaya omega-3 seperti ikan salmon.",
        "Minum banyak air untuk menjaga tubuh tetap terhidrasi.",
        "Konsumsi makanan yang kaya vitamin C untuk mendukung sistem pernapasan."
      ]
    },
    {
      "keluhan": "Saya merasa kelelahan dan lesu meskipun sudah cukup tidur.",
      "penyakit": [
        "Anemia: Kekurangan sel darah merah yang dapat menyebabkan kelelahan.",
        "Hipotiroidisme: Kondisi di mana kelenjar tiroid kurang aktif, menyebabkan kelelahan.",
        "Sleep Apnea: Gangguan tidur yang menyebabkan tidur tidak nyenyak.",
        "Depresi: Gangguan mental yang dapat menyebabkan kelelahan dan kurangnya energi.",
        "Diabetes: Kadar gula darah yang tidak terkontrol dapat menyebabkan kelelahan."
      ],
      "nutrisi": [
        "Konsumsi makanan kaya zat besi seperti bayam dan daging merah.",
        "Konsumsi makanan yang mengandung vitamin D dan B12.",
        "Konsumsi makanan dengan indeks glikemik rendah untuk menjaga kadar gula darah.",
        "Minum air putih untuk mencegah dehidrasi.",
        "Hindari konsumsi kafein berlebihan yang dapat mengganggu tidur."
      ]
    },
    {
      "keluhan":
          "Saya merasa nyeri pada bagian punggung bawah setelah duduk dalam waktu lama.",
      "penyakit": [
        "Hernia: Kelainan pada tulang belakang yang dapat menyebabkan nyeri punggung.",
        "Sciatica: Nyeri yang menjalar ke kaki akibat tekanan pada saraf sciatic.",
        "Osteoarthritis: Peradangan pada sendi yang dapat menyebabkan nyeri punggung.",
        "Fraktur Tulang Belakang: Patah tulang pada tulang belakang yang menyebabkan nyeri.",
        "Spondylolisthesis: Kondisi di mana satu tulang belakang bergeser dari posisi normal."
      ],
      "nutrisi": [
        "Konsumsi makanan kaya kalsium seperti susu dan keju.",
        "Konsumsi makanan kaya vitamin D untuk membantu penyerapan kalsium.",
        "Hindari makanan tinggi garam yang dapat menyebabkan penurunan kepadatan tulang.",
        "Konsumsi makanan kaya magnesium untuk kesehatan otot dan tulang.",
        "Perbanyak konsumsi ikan berlemak seperti salmon untuk mendukung kesehatan tulang."
      ]
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
        break; // Stay on Home Screen
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
            icon: Icon(Icons.exit_to_app, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/ivan.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Alexa',
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
            const SizedBox(height: 20),
            const Text(
              'Possible Disease',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Type Here ...',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 14, color: Colors.black),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  final inputKeluhan = _textController.text.trim();

                  if (inputKeluhan.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Masukkan keluhan terlebih dahulu!")),
                    );
                    return;
                  }

                  final diagnosis = dataset.firstWhere(
                    (data) => data["keluhan"]
                        .toLowerCase()
                        .contains(inputKeluhan.toLowerCase()),
                    orElse: () => {},
                  );

                  if (diagnosis.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              "Diagnosis tidak ditemukan untuk keluhan ini.")),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PossibleDiseasescreen(diagnosis: diagnosis),
                    ),
                  );
                },
                child: const Text("Entry"),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Manage Packages',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Manage Packages Section with Cards/Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard('assets/images/objek.png', 'Article', onTap: () {
                  // Handle Article tap
                }),
                buildCard('assets/images/pil.png', 'Nutrient', onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DrugsScreen()));
                }),
                buildCard('assets/images/ivann.png', 'Nutritionist', onTap: () {
                  // Handle Nutritionist tap
                }),
              ],
            ),
            const SizedBox(height: 20),
            Divider(),
            const SizedBox(height: 12),
            // Upcoming Appointments Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Appoinments',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentsScreen(),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentsScreen()),
                      );
                    },
                    child: Text("View Appoinment"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Warna latar belakang
                      foregroundColor: Colors.white, // Warna teks atau ikon
                    ),
                  )
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

  Widget buildCard(String imagePath, String title, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        // Menempatkan gambar dan teks dalam Column
        children: [
          Container(
            width: 110,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
