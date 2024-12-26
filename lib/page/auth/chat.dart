import 'package:flutter/material.dart';
import 'package:program/page/auth/home.dart'; // Import home.dart yang sesuai dengan path Anda

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  final Map<String, String> _responses = {
    "hello": "Hayy adakah yang bisa saya bantu?",
    "bagaimana kabarnya?": "halo saya disini akan membantu anda!",
    "permasalahan": "Tolong deskripsikan permasalahan anda secara terperinci",
    "bye": "Goodbye! Take care!",
    // Kategori Gejala Umum
    "saya sedang demam":
        "Demam adalah gejala umum. Sudahkah Anda mengukur suhu tubuh Anda?",
    "saya sedang sakit kepala":
        "Sakit kepala bisa disebabkan oleh berbagai hal. Apakah Anda juga merasa mual atau pusing?",
    "saya sedang batuk":
        "Apakah batuk Anda kering atau berdahak? Sudah berapa lama Anda mengalaminya?",
    "saya sedang pilek":
        "Pilek biasanya disebabkan oleh infeksi virus. Minum air hangat dan istirahat yang cukup.",
    "saya mengalami sesak napas":
        "Sesak napas perlu diperhatikan. Apakah Anda memiliki riwayat asma atau alergi?",
    // Kategori lainnya...
  };

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "text": message});
    });

    String response = "Maaf, saya tidak memahami pertanyaan Anda.";
    for (final keyword in _responses.keys) {
      if (message.toLowerCase().contains(keyword)) {
        response = _responses[keyword]!;
        break;
      }
    }

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({"sender": "bot", "text": response});
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ask me",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen()), // Navigasi ke halaman HomeScreen
              );
            },
          ),
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
                final isUser = message["sender"] == "user";

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: isUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isUser)
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/ivan.png'),
                        ),
                      if (!isUser) const SizedBox(width: 8),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color:
                                isUser ? Colors.green[300] : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            message["text"]!,
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      if (isUser) const SizedBox(width: 8),
                      if (isUser)
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/icons/Intersect.png'),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.attachment),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
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
            ),
          ),
        ],
      ),
    );
  }
}
