import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:paula/app/http/app_exceptions.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/service/prefs_service.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

class BaseClient {
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 20;
  Future<dynamic> get(String path) async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    var uri = Uri.https('paula-api.herokuapp.com', '/$path/');
    try {
      Response response = await client.get(
        uri,
        headers: {'Content-type': 'application/json'},
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } catch (err) {}
  }

  Future<dynamic> put(String path, dynamic body) async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    var uri = Uri.https('paula-api.herokuapp.com', '/$path/');
    try {
      Response response = await client.put(
        uri,
        body: body,
        headers: {'Content-type': 'application/json'},
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      var processReponse = _processResponse(response);
      print("base: $processReponse");
      return processReponse;
    } on SocketException {
      throw FetchDataException("Sem conexão com a internet", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Tente novamente mais tarde.", uri.toString());
    }
  }

  Future<dynamic> delete(int id) async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    var uri = Uri.https('paula-api.herokuapp.com', '/cadastro/$id/');
    try {
      Response response = await client.delete(uri, headers: {
        'Content-type': 'application/json'
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      var processReponse = _processResponse(response);
      return processReponse;
    } on SocketException {
      throw FetchDataException("Sem conexão com a internet", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Tente novamente mais tarde.", uri.toString());
    }
  }

  dynamic _processResponse(Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        Map<String, dynamic> json = jsonDecode(response.body);
        await PrefsService.saveUser(json);
        return UsuarioAPI(json['name'], json['username'], json['gender'],
            json['age'], json['birthdate'], json['progress'],
            id: json['id'], token: json['token']);
      case 202:
        Map<String, dynamic> json = jsonDecode(response.body);
        return UsuarioAPI(json['name'], json['new_username'], json['gender'],
            json['age'], json['birthdate'], json['progress'],
            id: json['id'], token: json['token']);
      case 204:
        return Response("Usuario deletado com sucesso!", 204);
      case 404:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      default:
        throw BadRequestException("Não foi possível realizar esta ação.",
            response.request?.url.toString());
    }
  }
}
