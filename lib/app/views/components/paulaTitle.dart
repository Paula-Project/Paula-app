import 'package:flutter/material.dart';

class PaulaTitleComponent extends StatelessWidget {
  const PaulaTitleComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("PAULA",
          style: TextStyle(
            color: Colors.red,
            fontSize: 60,
            fontFamily: "Nunito",
            fontWeight: FontWeight.normal,
            letterSpacing: 20,
          )),
    );
  }
}