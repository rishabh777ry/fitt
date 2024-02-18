import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),

              // Profile picture
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/random/100x100'),
                ),
              ),
              SizedBox(height: 20.0),

              // Username
              Center(
                child: Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),

              // Bio
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod mi eu sapien rhoncus, eget tincidunt augue interdum.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),

              // Edit profile button
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile screen
                  Navigator.pushNamed(context, '/editProfile');
                },
                child: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange, // Change button color to orange
                  padding: EdgeInsets.symmetric(vertical: 15.0), // Add padding
                ),
              ),

              // Divider
              SizedBox(height: 20.0),
              Divider(),

              // List of profile details
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('johndoe@example.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('+1 234 567 8901'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'Location',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('New York, NY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
