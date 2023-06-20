import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/login_signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

class ScreenRegisterPage extends StatelessWidget {
  ScreenRegisterPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();
  final TextEditingController _mobilenoController = TextEditingController();

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
                  height: 15,
                ),
                Text(
                  'Register',
                  style: GoogleFonts.chakraPetch(
                      fontSize: 33, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43.0, right: 43.0, top: 25),
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43.0, right: 43.0, top: 20),
                  child: TextField(
                    controller: _confirmpassController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.chakraPetch(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43.0, right: 43.0, top: 20),
                  child: TextField(
                    controller: _mobilenoController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Mobile Number',
                      hintStyle: GoogleFonts.chakraPetch(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim())
                        .then((value) {});
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => Bottom()));
                  },
                  child: Container(
                    width: 280,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green),
                    child: Center(
                      child: Text(
                        'Register',
                        style: GoogleFonts.chakraPetch(
                            fontSize: 17, color: Colors.black),
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
                      'Already have an account? ',
                      style: GoogleFonts.chakraPetch(
                          fontSize: 12, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) => Login()));
                      },
                      child: Text(
                        'Login now',
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
