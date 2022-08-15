import 'package:flutter/material.dart';

class DialogTextBox extends StatelessWidget {
  final String TextContent;

  const DialogTextBox({
    Key? key,
    required this.TextContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipPath(
              clipper: CustomTriangleClipper(),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(199, 37, 85, 124)),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(199, 37, 85, 124),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              TextContent,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
