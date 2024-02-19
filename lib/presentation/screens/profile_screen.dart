import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF9F9F9),
        child: ListView(
          children: const [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://pics.craiyon.com/2023-11-23/NNOjmGc3ROC5nulBSkI94Q.webp'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    'John Doe', 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'john.doe@example.com', 
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileListItem(
              icon: Icons.person_outline_rounded,
              title: 'Profile',
            ),
            ProfileListItem(
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
            ),
            ProfileListItem(
              icon: Icons.history_outlined,
              title: 'Order History',
            ),
            ProfileListItem(
              icon: Icons.location_history_outlined,
              title: 'Delivery Address',
            ),
            ProfileListItem(
              icon: Icons.headset_mic_outlined,
              title: 'Support Center',
            ),
            ProfileListItem(
              icon: Icons.policy_outlined,
              title: 'Legal Policy',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileListItem({super.key, 
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 0, 
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: () {
            // Handle tap
          },
        ),
      ),
    );
  }
}