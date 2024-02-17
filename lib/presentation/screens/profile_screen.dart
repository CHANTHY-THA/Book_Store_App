import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
