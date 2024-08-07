
import 'package:flutter/material.dart';
import 'package:gcuconnect/edit_message.dart';
import 'package:gcuconnect/message_details.dart';
import 'message.dart';
import 'message_service.dart';

class MessageScreen extends StatefulWidget {
  final int senderId;
  final int receiverId;

  const MessageScreen({Key? key, required this.senderId, required this.receiverId}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final MessageService _messageService = MessageService(baseUrl: 'http://localhost:8080');
  final TextEditingController _controller = TextEditingController();
  List<Message> _messages = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    try {
      final response = await _messageService.getMessages(widget.senderId, widget.receiverId);
      setState(() {
        _messages = response;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching messages: $error');
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final newMessage = Message(
      messageId: 0,
      senderId: widget.senderId,
      receiverId: widget.receiverId,
      content: _controller.text,
      messageDate: DateTime.now(),
    );

    try {
      final sentMessage = await _messageService.sendMessage(newMessage);
      setState(() {
        _messages.add(sentMessage);
        _controller.clear();
      });
    } catch (error) {
      print('Error sending message: $error');
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to send message')),
    );
    }
  }

  Future<void> _deleteMessage(int messageId) async {
    try {
      await _messageService.deleteMessage(messageId);
      setState(() {
        _messages.removeWhere((message) => message.messageId == messageId);
      });
    } catch (error) {
      print('Error deleting message: $error');
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to delete message')),
    );
    }
  }
  Future<void> _editMessage(Message message) async {
    final updatedMessage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMessageScreen(message: message),
      ),
    );
    if (updatedMessage != null) {
      try {
        final response = await _messageService.updateMessage(message.messageId, updatedMessage);
        setState(() {
          _messages[_messages.indexWhere((m) => m.messageId == message.messageId)] = response;
        });
      } catch (error) {
        print('Error updating message: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update message')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return ListTile(
                        title: Text(message.content),
                        subtitle: Text(message.messageDate.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                final updatedMessage = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditMessageScreen(message: message),
                                  ),
                                );
                                if (updatedMessage != null) {
                                  setState(() {
                                    _messages[_messages.indexWhere((m) => m.messageId == message.messageId)] = updatedMessage;
                                  });
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _deleteMessage(message.messageId),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MessageDetailScreen(message: message),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(hintText: 'Enter message...'),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}