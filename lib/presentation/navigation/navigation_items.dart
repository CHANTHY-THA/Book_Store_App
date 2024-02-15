import 'package:flutter/material.dart';

class NavigationItem {
  final String title;
  final IconData icon;
  final String route;

  NavigationItem({required this.title, required this.icon, required this.route});
}

List<NavigationItem> navigationItems = [
  NavigationItem(title: 'Home', icon: Icons.home, route: '/home'),
  NavigationItem(title: 'Books', icon: Icons.book, route: '/books'),
  NavigationItem(title: 'Cart', icon: Icons.shopping_cart, route: '/cart'),
  NavigationItem(title: 'Profile', icon: Icons.person, route: '/profile'),
];

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Adjust the background color as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navigationItems.map((item) {
          return Column(
            children: [
              IconButton(
                icon: Icon(item.icon),
                onPressed: () {
                  Navigator.pushNamed(context, item.route);
                },
              ),
              const SizedBox(height: 4), // Adjust the space between icon and title
              Text(item.title), // Display the title under the icon
            ],
          );
        }).toList(),
      ),
    );
  }
}

class YourScreen extends StatelessWidget {
  const YourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Screen'),
      ),
      body: const Center(
        child: Text('Your content goes here'),
      ),
      bottomNavigationBar: const BottomNavigation(), // Render BottomNavigation at the bottom
    );
  }
}
