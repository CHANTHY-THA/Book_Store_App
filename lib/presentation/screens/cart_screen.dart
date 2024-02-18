import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Cart Screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
