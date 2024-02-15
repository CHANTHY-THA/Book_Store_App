import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), 
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _zoomAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _controller.forward();

    Timer(const Duration(seconds: 5), () { 
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(), // Navigate to LoginScreen
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C8A7B), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _zoomAnimation,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/splash_screen.png', 
                      width: 200, 
                      height: 200, 
                    ),
                    // const SizedBox(height: 1),
                    const Text(
                      'FlyBook G4',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 1),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(_controller),
              child: const Text(
                'Welcome to our app!',
                style: TextStyle(fontSize: 18, color: Colors.white), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
