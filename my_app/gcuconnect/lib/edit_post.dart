import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPostPage extends StatefulWidget {
  final int postId;
  final String author;
  final String content;

  const EditPostPage({
    Key? key,
    required this.postId,
    required this.author,
    required this.content,
  }) : super(key: key);

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contentController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Post ID: ${widget.postId}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the updatePost function when the button is pressed
                _updatePost(context);
              },
              child: const Text('Update Post'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update the post
  void _updatePost(BuildContext context) async {
    try {
      final response = await http.put(
        Uri.parse('http://localhost:8080/posts/${widget.postId}'), // Adjust the URL accordingly
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add any required headers, such as authentication tokens
        },
        body: jsonEncode(<String, String>{
          'content': _contentController.text, // Use the updated content from the text field
        }),
      );
      if (response.statusCode == 200) {
        // Post updated successfully
        Navigator.pop(context, _contentController.text); // Pass back the updated content
      } else {
        // Error occurred while updating post
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update post')),
        );
      }
    } catch (e) {
      // Exception occurred
      print('Exception while updating post: $e');
    }
  }
}
