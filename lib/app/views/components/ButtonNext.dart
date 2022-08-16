import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ButtonNext extends StatelessWidget {
  final Widget pageWidget;
  final bool allowedReturn;

  const ButtonNext({
    this.allowedReturn = true,
    Key? key,
    required this.pageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.0,
          width: 150.0,
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none))),
            child: const Text('AVANÇAR',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => pageWidget,
                ),
                (route) => allowedReturn,
              );
            },
          ),
        ),
      ],
    );
  }
}
