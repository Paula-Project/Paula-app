import 'package:flutter/material.dart';
import 'package:paula/app/views/layout/layout.dart';

class PersonData extends StatelessWidget {
  const PersonData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      indexPage: 1,
      bodyContent: Container(
        margin: const EdgeInsetsDirectional.all(30),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return IconButton(
                      icon: const Icon(Icons.person_outline_sharp),
                      iconSize: constraint.maxWidth / (1.4),
                      color: Colors.white,
                      onPressed: () {},
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "@apelido",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        'Nome',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 207, 218, 216),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: const EdgeInsetsDirectional.only(top: 30, bottom: 30),
              height: MediaQuery.of(context).size.height / 4.2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Dados Pessoais",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 207, 218, 216),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: MediaQuery.of(context).size.height / 4.2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Conquistas",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
