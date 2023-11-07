// post_detail_page.dart
import 'package:flutter/material.dart';

// Assuming you have a Post model, import it here
// import 'path_to_your_post_model.dart';

class PostDetailPage extends StatelessWidget {
  final String title;
  final String content;

  // In a real app, you might pass a Post object instead of individual fields.
  PostDetailPage({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Display the title of the post
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
                'assets/post_placeholder_image.png'), // Placeholder image for the post
            SizedBox(height: 8.0),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            // TODO: Add more post details if necessary
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border),
        onPressed: () {
          // TODO: Implement the favorite action
        },
      ),
    );
  }
}
