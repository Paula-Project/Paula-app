import 'package:flutter/material.dart';
import 'package:paula/app/helper/dialog_helper.dart';
import 'package:paula/app/http/app_exceptions.dart';

class BaseController {
  handleError(error) {
    hideDialog();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorSnackbar(message: message!);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorSnackbar(message: message!, icon: Icons.wifi);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      DialogHelper.showErrorSnackbar(message: message!);
    }
  }

  showSucess(message, icon) {
    DialogHelper.showSucessSnackbar(message: message!, icon: icon);
  }

  showLoading() {
    DialogHelper.showLoading();
  }

  hideDialog() {
    DialogHelper.hideDialog();
  }

  Future<bool> showConfirmationDialog(title, message) {
    return DialogHelper.showConfirmationDialog(title: title, message: message);
  }
}
