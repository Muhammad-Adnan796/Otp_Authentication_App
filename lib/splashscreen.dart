import 'package:ecommerce_app/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {

 static String id = '/splashScreen';



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 10), ()
        { Navigator.pushReplacementNamed(
        context, LoginPage.id
        );
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Image(
              image: AssetImage("images/logo.jpg"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Text(
              "Login with OTP",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}