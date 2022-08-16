import 'package:flutter/material.dart';

class ModuleButton extends StatefulWidget {
  const ModuleButton(this._align, this._text, this._page, this._isActive,
      {Key? key})
      : super(key: key);

  final AlignmentGeometry _align;
  final String _text;
  final Widget _page;
  final bool _isActive;

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
          minimumSize: Size(120.0, 120.0),
          shape: CircleBorder(),

          primary: (widget._isActive)
              ? Colors.blue
              : Colors.grey, // <-- Button color
          onPrimary: (widget._isActive)
              ? Color.fromARGB(255, 133, 185, 228)
              : Colors.red, // <-- Splash color
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
