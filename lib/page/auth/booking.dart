import 'package:flutter/material.dart';
import 'package:program/page/auth/chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengubah latar belakang menjadi putih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    "Nutritionist Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Kotak profil berbentuk persegi dengan gambar dari assets
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                              Border.all(color: Colors.grey[300]!, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/booking.png', // Ganti dengan path gambar profil Anda
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nutritionist Alex",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Gastro Specialist",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Text(
                                "4.8",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                " (2.3 reviews)",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 81, 125, 82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 32),
                    ),
                    child: const Text(
                      "Appointment Date",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Color.fromARGB(255, 70, 123, 71),
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "BOOKING SUCCESSFUL",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Your Appointment Successfully Confirmed",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      TimeSlotButton(time: "13:00 AM"),
                      TimeSlotButton(time: "14:00 AM"),
                      TimeSlotButton(time: "15:00 PM"),
                      TimeSlotButton(time: "16:00 AM"),
                      TimeSlotButton(time: "17:00 AM"),
                      TimeSlotButton(time: "18:00 PM"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman HomeIvan setelah tombol DONE ditekan
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 32),
                    ),
                    child: const Text(
                      "DONE",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlotButton extends StatelessWidget {
  final String time;

  const TimeSlotButton({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
