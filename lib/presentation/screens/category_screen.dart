import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: const Center(
        child: Text('Category Screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
