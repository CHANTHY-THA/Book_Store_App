import 'package:flutter/material.dart';
import 'package:test/presentation/screens/favourite_screen.dart';
import 'package:test/presentation/screens/category_screen.dart';
import 'package:test/presentation/screens/cart_screen.dart';
import 'package:test/presentation/screens/home_screen.dart';
import 'package:test/presentation/screens/profile_screen.dart';
import 'package:test/presentation/screens/book_details_screen.dart';
import 'package:test/presentation/screens/product_search_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // ignore: unused_field
  static final List<Widget> _screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const ProductSearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding screen based on the index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavouriteScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  CategoryScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
          // MaterialPageRoute(builder: (context) => const ProductSearchScreen()),
          // MaterialPageRoute(builder: (context) => const BookDetailScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
         BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_rounded),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_mall_outlined),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF0C8A7B),
      unselectedItemColor: Colors.blueGrey,
      onTap: _onItemTapped,
    );
  }
}
