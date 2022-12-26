import 'package:flutter/material.dart';
import 'package:paula/app/views/home_page.dart';

Future<bool> exitDialog(
  BuildContext context,
) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Tem certeza de que quer sair?",
            style: TextStyle(
              color: Colors.black,
              //fontSize: 20,
            ),
          ),
          titlePadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          content: const Text(
            "Todo o progresso dessa lição será perdido",
            style: TextStyle(
              color: Colors.black,
              //fontSize: 20,
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.close,
                  size: 40,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false,
                  );
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.green,
                ))
          ],
        );
      });
  return false;
}
