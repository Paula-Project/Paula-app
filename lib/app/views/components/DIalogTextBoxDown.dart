import 'package:flutter/material.dart';

class DialogTextBoxDown extends StatelessWidget {
  final String TextContent;

  const DialogTextBoxDown({
    Key? key,
    required this.TextContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(199, 37, 85, 124),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              TextContent,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
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
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.height, size.width);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
