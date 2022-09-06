
import 'package:flutter/material.dart';
void main() => runApp(const LessonFinal(imageUrl: '',));

class LessonFinal extends StatelessWidget {
  final String imageUrl;

    const LessonFinal({Key? key, required this.imageUrl, }) : super(key: key);

    Widget build2(BuildContext context){
      return Material(
          child: Container(
              decoration: const BoxDecoration(
                color : Colors.white,
              ),
              child: Column(
                  children: const [
                    LessonFinal(
                      imageUrl: 'assets/images/pineapple.png',
                    )
                  ]
              )
          )
      );
    }

    @override
  Widget build(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('E'),
            ),
          ],
        ),
      );
    }

    Widget build_(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('S'),
            ),
          ],
        ),
      );
    }

    Widget build_1(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('C'),
            ),
          ],
        ),
      );
    }

    Widget build_2(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('A'),
            ),
          ],
        ),
      );
    }

    Widget build_3(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('D'),
            ),
          ],
        ),
      );
    }

    Widget build_4(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('A'),
            ),
          ],
        ),
      );
    }



    Widget build1(BuildContext context){
      return Material(
        child: Container(
          decoration: const BoxDecoration(
            color : Colors.white,
          ),
          child: Column(
            children: const [
              LessonFinal(
                imageUrl: 'assets/images/lata.png',
              )
            ]
          )
        )
      );
    }

    Widget build_5(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('F'),
            ),
          ],
        ),
      );
    }

    Widget build_6(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('A'),
            ),
          ],
        ),
      );
    }

    Widget build_7(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('C'),
            ),
          ],
        ),
      );
    }

    Widget build_8(BuildContext context){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('A'),
            ),
          ],
        ),
      );
    }

}

