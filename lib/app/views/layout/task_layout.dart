import 'package:flutter/material.dart';
import 'package:paula/app/views/components/exitDialog.dart';

class TaskLayout extends StatelessWidget {
  final Widget body;
  final bool shouldPop;
  const TaskLayout({super.key, required this.body, required this.shouldPop});

  @override
  Widget build(BuildContext context) {
    onwillpop() {
      if (shouldPop) {
        return exitDialog(context);
      } else {
        return Future.value(false);
      }
    }

    return WillPopScope(child: body, onWillPop: () => onwillpop());
  }
}
