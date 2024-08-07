import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post_list.dart'; // Import the Post class from post_list.dart
import 'edit_post.dart';

class PostDetailsPage extends StatefulWidget {
  final Post post;
  final void Function(int postId) onDelete; // Callback function to notify parent about deletion

  const PostDetailsPage({Key? key, required this.post, required this.onDelete}) : super(key: key);

  @override
  _PostDetailsPageState createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  String _content = '';

  @override
  void initState() {
    super.initState();
    _content = widget.post.content;
  }

  // Method to update the content when receiving updated data
  void _updateContent(String updatedContent) {
    setState(() {
      _content = updatedContent;
    });
  }

  // Function to notify parent widget about post deletion
  void _notifyParentAboutDeletion() {
    widget.onDelete(widget.post.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Post ID: ${widget.post.postId}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(_content),
            const SizedBox(height: 10),
            Text('By ${widget.post.author}'),
            const SizedBox(height: 10),
            Text('Likes: ${widget.post.likes.toString()}'),
            Text('Comments: ${widget.post.comments.toString()}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the edit page with existing post data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPostPage(
                          postId: widget.post.postId,
                          author: widget.post.author,
                          content: _content,
                        ),
                      ),
                    ).then((updatedContent) {
                      if (updatedContent != null) {
                        // Update content if it's not null
                        _updateContent(updatedContent);
                      }
                    });
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Show a confirmation dialog before deleting the post
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text('Are you sure you want to delete this post?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Call the function to delete the post
                                _deletePost(context);
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to delete the post
void _deletePost(BuildContext context) async {
  try {
    final response = await http.delete(
      Uri.parse('http://localhost:8080/posts/${widget.post.postId}'), // Adjust the URL accordingly
      headers: <String, String>{
        // Add any required headers, such as authentication tokens
      },
    );
    if (response.statusCode == 204) {
      // Post deleted successfully
      // Pop the navigation stack until you reach the post list page
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } else {
      // Error occurred while deleting post
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete post')),
      );
    }
  } catch (e) {
    // Exception occurred
    print('Exception while deleting post: $e');
  }
}
}