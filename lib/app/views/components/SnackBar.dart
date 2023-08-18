import 'package:flutter/material.dart';

class SnackBarComponent {
  snackBlue(String message) {
    return SnackBar(
        backgroundColor: Color.fromARGB(255, 41, 171, 226),
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}
