import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
 static String id = '/homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
    );
  }
}
