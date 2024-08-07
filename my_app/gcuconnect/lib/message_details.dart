import 'package:flutter/material.dart';
import 'message.dart';

class MessageDetailScreen extends StatelessWidget {
  final Message message;

  const MessageDetailScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Message ID: ${message.messageId}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Sender ID: ${message.senderId}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Receiver ID: ${message.receiverId}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Content: ${message.content}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Date: ${message.messageDate}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
