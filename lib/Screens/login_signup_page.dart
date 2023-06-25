import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.chakraPetch(
                      fontSize: 33, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43.0, right: 43.0, top: 30),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Email',
                        hintStyle: GoogleFonts.chakraPetch()),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43.0, right: 43.0, top: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.chakraPetch(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim())
                        .then((value) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => Bottom()));
                    });
                  },
                  child: Container(
                    width: 280,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.chakraPetch(
                            fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: GoogleFonts.chakraPetch(
                          fontSize: 14, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ScreenRegisterPage()));
                      },
                      child: Text(
                        'Register Now',
                        style: GoogleFonts.chakraPetch(
                            fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
