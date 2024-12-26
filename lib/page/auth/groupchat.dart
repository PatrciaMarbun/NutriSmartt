import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Groupchat(),
    );
  }
}

class Groupchat extends StatefulWidget {
  const Groupchat({super.key});

  @override
  _GroupchatState createState() => _GroupchatState();
}

class _GroupchatState extends State<Groupchat> {
  final List<Map<String, String>> _messages = []; // List untuk menyimpan pesan
  final TextEditingController _controller = TextEditingController();

  // Dataset percakapan
  final List<List<Map<String, String>>> _conversations = [
    [
      {
        "sender": "Budi",
        "message": "Halo Ali, sudah periksa suhu tubuhmu?",
        "timestamp": "08:02 AM"
      },
      {
        "sender": "Clara",
        "message": "Ali, ada gejala lain seperti batuk atau pilek?",
        "timestamp": "08:05 AM"
      },
    ],
    [
      {
        "sender": "Budi",
        "message": "Bisa jadi itu flu. Sudah istirahat yang cukup?",
        "timestamp": "08:10 AM"
      },
      {
        "sender": "Clara",
        "message": "Minum banyak air hangat ya, Ali. Itu bisa membantu.",
        "timestamp": "08:12 AM"
      },
    ],
  ];

  int _conversationIndex = 0; // Menyimpan indeks percakapan

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      // Tambahkan pesan Ali
      _messages.add({
        "sender": "Ali",
        "message": message,
        "timestamp": _getCurrentTime()
      });
    });

    if (_conversationIndex < _conversations.length) {
      Future.delayed(const Duration(seconds: 2), () {
        // Tambahkan balasan Budi
        setState(() {
          _messages.add(_conversations[_conversationIndex][0]);
        });

        // Tambahkan balasan Clara setelah 4 detik
        Future.delayed(const Duration(seconds: 4), () {
          if (_conversationIndex < _conversations.length) {
            setState(() {
              _messages.add(_conversations[_conversationIndex][1]);
              _conversationIndex++;
            });
          }
        });
      });
    }

    _controller.clear();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 20,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Comunitas", style: TextStyle(color: Colors.black)),
                Text("Active now",
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.call, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.videocam, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSent = message["sender"] == "Ali";

                return _buildMessageBubble(
                  sender: message["sender"]!,
                  message: message["message"]!,
                  isSent: isSent,
                  timestamp: message["timestamp"]!,
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String sender,
    required String message,
    required bool isSent,
    required String timestamp,
  }) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isSent)
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage(sender == "Budi"
                      ? 'assets/budi.jpg'
                      : 'assets/clara.jpg'),
                ),
              if (!isSent) const SizedBox(width: 8),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(maxWidth: 250),
                decoration: BoxDecoration(
                  color: isSent ? Colors.green[300] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "$sender · $timestamp",
            style: const TextStyle(fontSize: 10, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attachment),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Type a message",
                border: InputBorder.none,
              ),
              onSubmitted: _sendMessage,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }
}
