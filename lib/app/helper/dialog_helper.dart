import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorSnackbar(
      {String title = "Error",
      String message = "Mensagem de erro",
      IconData icon = Icons.error}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      icon: Icon(icon),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      leftBarIndicatorColor: Colors.red,
    ));
  }

  static void showSucessSnackbar(
      {String title = "Error",
      String message = "Mensagem de erro",
      IconData icon = Icons.error}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      icon: Icon(icon),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
    ));
  }

  static Future<bool> showConfirmationDialog(
      {String title = "Tem certeza?", String message = ""}) async {
    bool confirm = false;
    await Get.dialog(AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      titlePadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      contentPadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      backgroundColor: Colors.white,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            confirm = false;
            hideDialog();
            return;
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          ),
          child: const Text('CANCELAR', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            confirm = true;
            hideDialog();
            return;
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          child: const Text('APAGAR', style: TextStyle(color: Colors.white)),
        ),
      ],
    ));
    return confirm;
  }

  static void showLoading() {
    Get.dialog(const Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: SpinKitCubeGrid(
        size: 100,
        color: Colors.white,
      ),
    ));
  }

  static void hideDialog() {
    if (Get.isDialogOpen!) Get.back();
  }
}
