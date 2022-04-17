import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/login_page.dart';
import 'package:ecommerce_app/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        SplashScreen.id : (context) => SplashScreen(),
        LoginPage.id : (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
      },

    );
  }
}
