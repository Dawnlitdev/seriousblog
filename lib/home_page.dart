// home_page.dart
import 'package:flutter/material.dart';
import 'post.dart';
import 'wordpress_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WordPressService _wordPressService;

  @override
  void initState() {
    super.initState();
    _wordPressService = WordPressService(baseUrl: 'https://kangtepedia.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _wordPressService.fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts found.'));
          } else {
            List<Post> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return ListTile(
                  leading: Image.network(post.featuredMediaUrl,
                      width: 100, fit: BoxFit.cover),
                  title: Text(post.title),
                  subtitle: Text(post.excerpt),
                  onTap: () {
                    // TODO: Navigate to the post detail page
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
