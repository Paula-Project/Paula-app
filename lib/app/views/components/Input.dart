import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String labelInputTxt;
  final bool obscureTxt;
  final TextEditingController controller;
  final List<TextInputFormatter> formatters;
  final TextInputType keyboardType;
  String? Function(String?)? valid;

  Input({
    Key? key,
    this.labelInputTxt = "",
    this.obscureTxt = false,
    this.formatters = const [],
    this.valid,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(labelInputTxt,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize:
                        MediaQuery.of(context).size.height > 600 ? 25 : 18,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w300)),
          ),
        ),
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromARGB(30, 0, 0, 0),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ]),
          child: TextFormField(
            controller: controller,
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height > 550 ? 15 : 8,
                  horizontal: 4),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
            ),
            inputFormatters: formatters,
            validator: valid,
            keyboardType: keyboardType,
            obscureText: obscureTxt,
            style: const TextStyle(color: Colors.black),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
