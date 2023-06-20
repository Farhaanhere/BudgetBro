import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/login_signup_page.dart';
import 'package:managment/Screens/screen_account.dart';
import 'package:managment/Screens/signup_page.dart';
import 'package:managment/Screens/statistics.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

import 'data/model/add_date.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  await Hive.openBox<double>(
      'walletBox'); // Initialize 'walletBox' for budget limit
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Bottom(),
        '/signup': (context) => ScreenRegisterPage(),
      },
      //home: ScreenAccount(),
    );
  }
}
