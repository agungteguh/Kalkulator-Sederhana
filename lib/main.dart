
//import 'package:belajarflutter_1/home_page.dart';
import 'package:belajarflutter_1/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator',
      theme:  ThemeData(
              scaffoldBackgroundColor: Colors.white
              ),
      home: MyLoginPage(),
    );
  }
}

