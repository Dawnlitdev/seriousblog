import 'package:flutter/material.dart';
import 'home_page.dart'; // Make sure this points to your HomePage file
import 'favorites_page.dart'; // Make sure this points to your FavoritesPage file
import 'categories_page.dart'; // Make sure this points to your CategoriesPage file
import 'post_detail_page.dart'; // Make sure this points to your PostDetailPage file

void main() {
  runApp(MyBlogApp());
}

class MyBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serious Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define the routes for navigating to different pages
      routes: {
        '/': (context) => MainScreen(),
        '/favorites': (context) => FavoritesPage(),
        '/categories': (context) => CategoriesPage(),
        // When navigating to the "/postDetail" route, build the PostDetailPage.
        '/postDetail': (context) => PostDetailPage(
              title:
                  'Dummy Post Title', // These would be dynamic in the real app
              content: 'Dummy content for the post goes here...',
            ),
      },
      initialRoute: '/',
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(),
    CategoriesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
