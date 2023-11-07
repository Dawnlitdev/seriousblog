// wordpress_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart'; // Import the Post model
import 'category.dart'; // Import the Category model

class WordPressService {
  final String baseUrl;

  WordPressService({required this.baseUrl});

  Future<List<Post>> fetchPosts() async {
    var url = Uri.parse('$baseUrl/wp-json/wp/v2/posts?_embed');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((postJson) => Post.fromJson(postJson)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Category>> fetchCategories() async {
    var url = Uri.parse('$baseUrl/wp-json/wp/v2/categories');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Add more methods for other WordPress API endpoints as needed
}
