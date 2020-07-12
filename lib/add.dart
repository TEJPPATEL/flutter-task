import 'package:flutter/material.dart';

import 'home.dart';

class Adduser extends StatelessWidget {
  Widget build(BuildContext context) {
    Future navigateToHome(context) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Add User")),
      body: Container(
        child: Center(
          child: Text("Add User"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {print("Clicked"), navigateToHome(context)},
      ),
    );
  }
}
