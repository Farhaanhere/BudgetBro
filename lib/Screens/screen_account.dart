import 'package:flutter/material.dart';
import 'package:managment/Screens/profile.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => ProfilePage()),
            );
          },
        ),
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Prince Riyas'),
              ),
            ],
          ),
          Row(
            children: [TextField()],
          ),
        ],
      ),
    );
  }
}
