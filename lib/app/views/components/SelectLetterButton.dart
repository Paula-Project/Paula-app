import 'package:flutter/material.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';

class SelectLetterButton extends StatefulWidget {
  final String letter;
  bool statusResolved;
  final TaskVogalSelectionModel task;
  final Function addVogal;
  final Function removeVogal;

  SelectLetterButton({
    Key? key,
    required this.letter,
    required this.statusResolved,
    required this.task,
    required this.addVogal,
    required this.removeVogal,
  }) : super(key: key);

  @override
  State<SelectLetterButton> createState() => _SelectLetterButtonState();
}

class _SelectLetterButtonState extends State<SelectLetterButton> {
  bool isSelected = false;
  selectLetter() {
    isSelected = !isSelected;
    if (isSelected) {
      widget.addVogal();
    } else {
      widget.removeVogal();
    }
  }

  Color colorFontStatus() {
    if (isSelected) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color colorBgStatus() {
    if (isSelected && !widget.statusResolved) {
      return Colors.blue;
    } else if (isSelected && !widget.statusResolved) {
      return Colors.white70;
    } else if (widget.statusResolved) {
      if (widget.task.lettersCorrect
          .any((element) => element == widget.letter && isSelected)) {
        return Colors.green;
      } else if (widget.task.lettersCorrect
          .any((element) => element == widget.letter && isSelected == false)) {
        return Colors.yellow;
      } else if (isSelected) {
        return Colors.red;
      }
    }
    return Colors.white70;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () => {
          setState(() => {
                selectLetter(),
              }),
        },
        style: TextButton.styleFrom(
          backgroundColor: colorBgStatus(),
          textStyle: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(
          widget.letter,
          style: TextStyle(color: colorFontStatus()),
        ),
      ),
    );
  }
}
