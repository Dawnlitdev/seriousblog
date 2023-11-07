// post.dart
class Post {
  final int id;
  final String title;
  final String excerpt;
  final String content;
  final String featuredMediaUrl;

  Post({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.featuredMediaUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      excerpt: json['excerpt']['rendered'] as String,
      content: json['content']['rendered'] as String,
      // Make sure to handle media URLs correctly based on your API response structure
      featuredMediaUrl:
          json['_embedded']['wp:featuredmedia'][0]['source_url'] as String,
    );
  }
}
