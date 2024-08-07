import 'package:flutter/material.dart';
import 'message.dart';
import 'message_service.dart';

class EditMessageScreen extends StatefulWidget {
  final Message message;

  const EditMessageScreen({Key? key, required this.message}) : super(key: key);

  @override
  _EditMessageScreenState createState() => _EditMessageScreenState();
}

class _EditMessageScreenState extends State<EditMessageScreen> {
  late TextEditingController _controller;
  final MessageService _messageService = MessageService(baseUrl: 'http://localhost:8080');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.message.content);
  }

  Future<void> _updateMessage() async {
    if (_controller.text.isEmpty) return;

    final updatedMessage = Message(
      messageId: widget.message.messageId,
      senderId: widget.message.senderId,
      receiverId: widget.message.receiverId,
      content: _controller.text,
      messageDate: widget.message.messageDate,
    );

    try {
      await _messageService.updateMessage(widget.message.messageId, updatedMessage);
      Navigator.pop(context, updatedMessage);
    } catch (error) {
      print('Error updating message: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter new message...'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateMessage,
              child: Text('Update Message'),
            ),
          ],
        ),
      ),
    );
  }
}
