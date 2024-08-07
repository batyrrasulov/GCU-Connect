import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_details.dart';
import 'add_post.dart'; // Import the AddPostPage class

class Post {
  final int postId;
  final String author;
  final String content;
  final DateTime postDate;
  final int likes;
  final int comments;

  Post({
    required this.postId,
    required this.author,
    required this.content,
    required this.postDate,
    required this.likes,
    required this.comments,
  });
}

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = []; // List to hold posts

  // Function to fetch posts from the backend
  Future<void> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/posts'),
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('user:0a769a66-0634-4080-a798-b8aa570050b3'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        List<dynamic> responseData = json.decode(response.body);
        setState(() {
          posts = responseData.map((postJson) {
            return Post(
              postId: postJson['postId'],
              author: postJson['userId'] != null ? postJson['userId']['username'] : 'Unknown', 
              content: postJson['content'],
              postDate: DateTime.parse(postJson['post_date']),
              likes: postJson['likes'],
              comments: postJson['comments'],
            );
          }).toList();
        });
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to load posts: $e');
    }
  }

  // Function to remove a deleted post from the list
  void _removeDeletedPost(int deletedPostId) {
    setState(() {
      posts.removeWhere((post) => post.postId == deletedPostId);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts(); // Fetch posts when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPostPage()),
              ).then((value) {
                // Refresh the post list when returning from add post page
                if (value == true) {
                  fetchPosts();
                }
              });
            },
          ),
        ],
      ),
      body: posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Post ID: ${posts[index].postId}'), // Display post ID as title
                  subtitle: Text(posts[index].content), // Display post content
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Likes: ${posts[index].likes.toString()}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'Comments: ${posts[index].comments.toString()}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsPage(
                          post: posts[index],
                          onDelete: _removeDeletedPost, // Pass the callback function
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
