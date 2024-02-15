import 'package:flutter/material.dart';
import 'splash_screen.dart'; 
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  bool _rememberFor30Days = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      print('Username: $username');
      print('Password: $password');
      print('Remember for 30 days: $_rememberFor30Days');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Welcome back Please enter both username and password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _navigateToRegistrationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SplashScreen()), // Navigate to splash screen
            );
          },
        ),
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // h1 siz
              ),
              SizedBox(height: 8), 
              Text(
                'Please enter your details', 
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16.0), 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 400), 
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            fillColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return const Color(0xFF0C8A7B); 
                              }
                              return Colors.transparent; 
                            }),
                            side: BorderSide(color: Colors.grey), 
                          ),
                        ),
                        child: Checkbox(
                          value: _rememberFor30Days,
                          onChanged: (value) {
                            setState(() {
                              _rememberFor30Days = value!;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Remember for 30 days',
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                      Spacer(), 
                      TextButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C8A7B),
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle Google login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: Icon(Icons.g_mobiledata),
                    label: Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: _navigateToRegistrationScreen,
                child: Text(
                  "Don't have an account? Sign up for free",
                  style: TextStyle(color: Colors.green), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

