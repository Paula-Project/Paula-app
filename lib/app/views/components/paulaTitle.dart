import 'package:flutter/material.dart';

class PaulaTitleComponent extends StatelessWidget {
  const PaulaTitleComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text("PAULA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontFamily: "Nunito",
              fontWeight: FontWeight.normal,
              letterSpacing: 10,
            )),
      ),
    );
  }
}
