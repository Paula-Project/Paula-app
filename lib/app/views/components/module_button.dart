import 'package:flutter/material.dart';

class ModuleButton extends StatefulWidget {
  const ModuleButton(this._align, this._text, this._page,this._color, {Key? key})
      : super(key: key);

  final AlignmentGeometry _align;
  final String _text;
  final Widget _page;
  final Color _color;


  @override
  State<ModuleButton> createState() => _ModuleButtonState();
}

class _ModuleButtonState extends State<ModuleButton> {
  _ModuleButtonState();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget._align,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => widget._page,
            ),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150.0, 150.0),
          shape: const CircleBorder(),

          primary: widget._color, // <-- Button color
          onPrimary: Colors.grey, // <-- Splash color
        ),
        child: Text(
          widget._text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
    );
  }
}
