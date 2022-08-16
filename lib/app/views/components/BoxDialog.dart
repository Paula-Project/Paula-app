import 'package:flutter/material.dart';

class BoxDialog extends StatelessWidget {
  const BoxDialog({Key? key, required this.messageButton, required this.message, required this.color})
      : super(key: key);

  final String messageButton;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      alignment: Alignment.bottomCenter,
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            padding: EdgeInsets.only(top: 30),
            height: height * 0.08,
            width: width,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: color),
            ),
          );
        },
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.fromLTRB(50,20,50,20)),
            backgroundColor: MaterialStateColor.resolveWith((states) => color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide.none)),
          ),
          child: Text(
            messageButton,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
