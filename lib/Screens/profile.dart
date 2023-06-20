import 'package:flutter/material.dart';
import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/login_signup_page.dart';
import 'package:managment/Screens/screen_account.dart';
import 'package:managment/Screens/screen_security.dart';
import 'package:managment/Screens/screen_about.dart';

import 'package:managment/widgets/bottomnavigationbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
        automaticallyImplyLeading: false, // Remove the back button
        actions: [
          IconButton(
            onPressed: () {
              // Add functionality for logout button
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => Login()),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user_icon.png'),
              ),
              SizedBox(height: 10),
              Text(
                'Prince Riyas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '@prince_pr',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for button 1
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ScreenAccount()),
                  );
                },
                icon: Icon(Icons.account_circle),
                label: Text('Account Info'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 47, 125, 121),
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for button 2
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => Screensecurity()),
                  );
                },
                icon: Icon(Icons.security),
                label: Text('Login and Security'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 47, 125, 121),
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for button 3
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => Screenabout()),
                  );
                },
                icon: Icon(Icons.info),
                label: Text('About Us'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 47, 125, 121),
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
