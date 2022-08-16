import 'package:flutter/material.dart';

class BoxDialog extends StatelessWidget {
  const BoxDialog({Key? key, required this.feedback, required this.resposta})
      : super(key: key);

  final String resposta;
  final bool feedback;

  @override
  Widget build(BuildContext context) {

    String message = 'VOCÊ ACERTOU!';
    String messageButton = 'CONTINUAR';
    Color color = Colors.green;
    double padding = 15.0;
    if(!feedback) {
      message = 'Incorreto \n Resposta: $resposta';
      messageButton = 'TENTAR DE NOVO';
      color = Colors.red;
      padding = 0;
    }


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
            padding: EdgeInsets.only(top: padding),
            height: height * 0.08,
            width: width,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: color,
              fontSize: 30,
              fontWeight: FontWeight.bold),
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
