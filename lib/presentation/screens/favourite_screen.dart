import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

// ignore: use_key_in_widget_constructors
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: const Center(
        child: Text('Favorite Screen Content'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
