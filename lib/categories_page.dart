// categories_page.dart
import 'package:flutter/material.dart';

// Assuming you have a Category model, import it here
// import 'path_to_your_category_model.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // This list will be populated with categories from the WordPress API.
  // Placeholder for now with dummy categories.
  List<String> categories = [
    'Technology',
    'Lifestyle',
    'Sports',
    'Entertainment'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(categories[index]),
              onTap: () {
                // TODO: Handle category tap, likely navigating to a list of posts within the category
              },
            ),
          );
        },
      ),
    );
  }
}
