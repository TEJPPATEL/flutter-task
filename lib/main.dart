import 'package:flutter/material.dart';
import 'package:registrationDemo/add.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      home: Adduser(),
      theme: ThemeData(
        primarySwatch: Colors.teal
        // primaryColor: Colors.white,
        // canvasColor: Colors.white,
      
      ),
    );
  }
}
