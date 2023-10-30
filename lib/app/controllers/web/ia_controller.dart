import 'dart:convert';

import 'package:paula/app/controllers/web/base_controller.dart';
import 'package:paula/app/http/ia_client.dart';

class IAController with BaseController {
  Future<dynamic> verifyAnswer(dynamic body) async {
    var response = await IAClient().post(body).catchError(handleError);
    if (response == null) return false;
    Map<String, dynamic> jsonMap = json.decode(response);
    String content = jsonMap["Heitor"];
    return content;
  }
}
