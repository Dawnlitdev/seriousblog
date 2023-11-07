// favorites_page.dart
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // This list will hold the titles of the posts that the user has favorited.
  // In a real app, you would likely have a more complex type here, such as a 'Post' model.
  List<String> favoritePosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: favoritePosts.isEmpty
          ? Center(child: Text('You have not added any favorites yet.'))
          : ListView.builder(
              itemCount: favoritePosts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoritePosts[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      // This will be called when the favorite icon is tapped.
                      // Here, you would typically remove the post from the favorites list and update the state.
                      setState(() {
                        favoritePosts.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    // TODO: Navigate to the post detail page
                  },
                );
              },
            ),
    );
  }
}
