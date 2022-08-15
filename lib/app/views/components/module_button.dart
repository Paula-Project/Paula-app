import 'package:flutter/material.dart';

class ModuleButton extends StatefulWidget {
  const ModuleButton(this._align, this._text, this._page, {Key? key})
      : super(key: key);

  final AlignmentGeometry _align;
  final String _text;
  final Widget _page

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
        style: ElevatedButton.styleFrom
          minimumSize: Size(120.0, 120.0),
          shape: CircleBorder(),

          primary: Colors.blue, // <-- Button color
          onPrimary: Colors.red, // <-- Splash color

        ),
        child: Text(
          widget._text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
    );
  }
}
