
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'message.dart';

class MessageService {
  final String baseUrl;

  MessageService({required this.baseUrl});

  Future<List<Message>> getMessages(int senderId, int receiverId) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/messages/all'),
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('user:0a769a66-0634-4080-a798-b8aa570050b3'))}',
                    'Content-Type': 'application/json',

        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((message) => Message.fromJson(message)).toList();
      } else {
        throw Exception('Failed to load messages. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load messages: $error');
    }
  }

  Future<Message> sendMessage(Message message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/messages'),
      headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('user:0a769a66-0634-4080-a798-b8aa570050b3'))}',
      'Content-Type': 'application/json',
    },
body: jsonEncode({
      'messageId': message.messageId,
      'senderId': {'userId': message.senderId},
      'receiverId': {'userId': message.receiverId},
      'content': message.content,
      'message_date': message.messageDate.toIso8601String(),
    }),    );

    if (response.statusCode == 201) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to send message. Status code: ${response.statusCode}');
    }
  }

  Future<Message> updateMessage(int messageId, Message updatedMessage) async {
    final response = await http.put(
      Uri.parse('$baseUrl/messages/$messageId'),
      headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('user:0a769a66-0634-4080-a798-b8aa570050b3'))}',
      'Content-Type': 'application/json',
    },
body: jsonEncode({
        'messageId': updatedMessage.messageId,
        'senderId': {'userId': updatedMessage.senderId},
        'receiverId': {'userId': updatedMessage.receiverId},
        'content': updatedMessage.content,
        'message_date': updatedMessage.messageDate.toIso8601String(),
      }),    );

    if (response.statusCode == 200) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update message. Status code: ${response.statusCode}');
    }
  }

  Future<void> deleteMessage(int messageId) async {
    final response = await http.delete(Uri.parse('$baseUrl/messages/$messageId'),
    
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('user:0a769a66-0634-4080-a798-b8aa570050b3'))}',
      'Content-Type': 'application/json',
    },
  );


    if (response.statusCode != 204) {
      throw Exception('Failed to delete message. Status code: ${response.statusCode}');
    }
  }
}
