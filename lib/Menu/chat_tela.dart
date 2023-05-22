import 'package:flutter/material.dart';

class ChatTela extends StatefulWidget {
  @override
  _ChatTelaState createState() => _ChatTelaState();
}

class _ChatTelaState extends State<ChatTela> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    // Get messages from restaurant
    _messages = ["Hello, how can I help you?"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Messages list
            ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
            // Message input field
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Digite sua mensagem...",
              ),
            ),
            // Send message button
            FloatingActionButton(
              child: Icon(Icons.send),
              onPressed: () {
                // Send message to restaurant
                _messages.add(_messageController.text);
                // Clear message input field
                _messageController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}