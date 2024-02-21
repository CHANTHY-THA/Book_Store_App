import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/presentation/screens/login_screen.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ProfileScreen({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }
  
    
  static const String token = 'http://localhost:5000/api/auth';

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token  = prefs.getString('jwt_token');
    final response = await http.get(Uri.parse('http://localhost:5000/api/user'),headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':"Bearer $token"
      });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final userData = jsonData['data']; 
      // print(userData['username']);
      // print(userData['email']);
      setState(() {
        username = userData['username'];
        email = userData['email'];
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: const Color(0xFFF9F9F9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://pics.craiyon.com/2023-11-23/NNOjmGc3ROC5nulBSkI94Q.webp'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      username ?? 'Pros',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email ?? 'pros@gmail.com',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const ProfileListItem(
                icon: Icons.person_outline_rounded,
                title: 'Profile',
              ),
              const ProfileListItem(
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
              ),
              const ProfileListItem(
                icon: Icons.history_outlined,
                title: 'Order History',
              ),
              const ProfileListItem(
                icon: Icons.location_history_outlined,
                title: 'Delivery Address',
              ),
              const ProfileListItem(
                icon: Icons.headset_mic_outlined,
                title: 'Support Center',
              ),
              const ProfileListItem(
                icon: Icons.policy_outlined,
                title: 'Legal Policy',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the login screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Logout', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileListItem({
    super.key,
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
