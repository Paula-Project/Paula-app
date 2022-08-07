import 'package:flutter/material.dart';

class ModuleButton extends StatefulWidget {
  const ModuleButton(this._align,this._text,{Key? key}) : super(key: key);

  final AlignmentGeometry _align;
  final String _text;

  @override
  State<ModuleButton> createState() => _ModuleButtonState(_align,_text);
}

class _ModuleButtonState extends State<ModuleButton> {
  final AlignmentGeometry _align;
  final String _text;


  _ModuleButtonState(this._align,this._text );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _align,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(120.0, 120.0),
          shape: CircleBorder(),

          primary: Colors.blue, // <-- Button color
          onPrimary: Colors.red, // <-- Splash color
        ),
        child: Text(
          _text,
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

