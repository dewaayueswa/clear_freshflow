import 'package:flutter/material.dart';

class ChatAdminScreen extends StatefulWidget {
  const ChatAdminScreen({Key? key}) : super(key: key);

  @override
  _ChatAdminScreenState createState() => _ChatAdminScreenState();
}

class _ChatAdminScreenState extends State<ChatAdminScreen> {
  final TextEditingController _messageController = TextEditingController();
  String _messageToSend = '';

  List<String> _adminMessages = [
    'Hello, disini saya admin',
    'Apakah Kakak ada keluhan dengan pelayanan Jasa kami?',
  ];

  List<String> _userMessages = [
    'Tidak ada, air galon sudah diantar dengan baik',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/admin1.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rossa - Admin Siang'),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
        backgroundColor:
            Colors.blue, // Ubah warna latar belakang App Bar menjadi biru
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_chat.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _adminMessages.length + _userMessages.length,
                  itemBuilder: (context, index) {
                    if (index < _adminMessages.length) {
                      return _buildAdminMessage(index);
                    } else {
                      return _buildUserMessage(index - _adminMessages.length);
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: _messageController,
                          onChanged: (value) {
                            _messageToSend = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminMessage(int index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _adminMessages[index],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildUserMessage(int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _userMessages[index],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageToSend.isNotEmpty) {
      setState(() {
        _userMessages.add(_messageToSend);
        _messageController.clear();
        _messageToSend = '';
      });
    }
  }
}
