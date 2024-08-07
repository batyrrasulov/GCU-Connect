import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  Future<void> _addPost() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/posts'),
        headers: {
          'Content-Type': 'application/json',
          // Add any other required headers, such as authorization
        },
        body: jsonEncode({
          'author': _authorController.text,
          'content': _contentController.text,
        }),
      );
      if (response.statusCode == 201) {
        // Post created successfully
        Navigator.pop(context, true); // Navigate back to previous screen with success
      } else {
        // Error occurred while creating post
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add post')),
        );
      }
    } catch (e) {
      // Exception occurred
      print('Exception while adding post: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(
                labelText: 'By', // Author field
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter post content';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPost,
              child: const Text('Add Post'),
            ),
          ],
        ),
      ),
    );
  }
}
