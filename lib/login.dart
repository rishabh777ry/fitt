import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'home.dart';
import 'gender.dart';

class LoginApp extends StatefulWidget {
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _showPassword = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              // Increase the text size for all the text widgets
              bodyColor: Colors.black, // Change the text color if needed
              fontSizeFactor:
                  1.1, // Adjust the factor to increase the text size
            ),
      ),
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            // Makes the content scrollable if it overflows
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  // Stack widget to overlap the image and text
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 125,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),

                SizedBox(height: 35.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  obscureText: !_showPassword, // Password field
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      // Login successful, navigate to home screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } catch (e) {
                      // Handle login errors
                      print('Error logging in: $e');
                    }
                  }, // Login button
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300,
                        50), // Adjust the minimum width and height of the button
                  ),
                ),
                SizedBox(height: 20.0), // Add spacing between the buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {}, // Google login button
                      icon: Container(
                        height: 24, // Adjust the height as needed
                        width: 24, // Adjust the width as needed
                        child: Image.asset('assets/google_logo.png'),
                      ),
                    ),
                    SizedBox(
                        width:
                            2), // Add spacing between the Google logo and text
                    Text('Login with Google'), // Add text after the Google logo
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    Builder(
                      builder: (context) => TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenderSelectionScreen()),
                          );
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
