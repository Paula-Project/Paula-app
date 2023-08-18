import 'package:flutter/material.dart';
import 'package:paula/app/controllers/web/base_controller.dart';
import 'package:paula/app/http/base_client.dart';

class UserController with BaseController {
  Future<dynamic> updateUser(String body) async {
    showLoading();
    var response =
        await BaseClient().put("update_user", body).catchError(handleError);
    hideDialog();
    showSucess(
      "Usuário alterado com sucesso!",
      Icons.account_circle_rounded,
    );
    return response;
  }

  Future<bool> deleteUser(int id) async {
    bool confirmation = await showConfirmationDialog(
        "Tem certeza que deseja apagar a sua conta?",
        "Esta ação é permanente e não pode ser desfeita");
    if (confirmation) {
      showLoading();
      var response = await BaseClient().delete(id).catchError(handleError);
      hideDialog();
      showSucess("Conta deletada com sucesso!", Icons.delete);
      if (response is Exception) {
        return false;
      }
      return true;
    }
    hideDialog();
    return false;
  }
}
