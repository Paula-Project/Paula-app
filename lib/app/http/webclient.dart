import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:paula/app/model/usuario.dart';
import '../model/usuarioAPI.dart';

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

Future<UsuarioAPI?> loginUsuario(String username, String password) async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String usuarioJson =
      jsonEncode({"username": username, "password": password});

  final Response response = await client.post(
      Uri.https('paula-api.herokuapp.com', '/login/'),
      headers: {'Content-type': 'application/json'},
      body: usuarioJson);

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return UsuarioAPI(json['name'], json['username'], json['gender'],
        json['age'], json['birthdate'],0,
        id: json['id'], token: json['token']);
  }

  return null;
}

Future<UsuarioAPI?> cadastroUsuario(Usuario usuario) async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String usuarioJson = jsonEncode(usuario.mapJson());

  final Response response = await client.post(
      Uri.https('paula-api.herokuapp.com', '/cadastro/'),
      headers: {'Content-type': 'application/json'},
      body: usuarioJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  if (response.statusCode == 201) {
    return UsuarioAPI(json['name'], json['username'], json['gender'],
        json['age'], json['birthdate'],0);
  }

  return null;
}

Future<bool> resetAuthenticatePassword(String username, String date) async {
  final Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String usuarioJson =
  jsonEncode({"username": username, "birthdate": date});

  final Response response = await client.post(
      Uri.https('paula-api.herokuapp.com', '/resetpassword/authenticate/'),
      headers: {'Content-type': 'application/json'},
      body: usuarioJson);

  if (response.statusCode == 200) {
    return true;
  }

  return false;
}

Future<bool> resetPassword(String username,String password) async {
  final Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String usuarioJson =
  jsonEncode({"username": username, "password": password});

  final Response response = await client.post(
      Uri.https('paula-api.herokuapp.com', '/resetpassword/reset/'),
      headers: {'Content-type': 'application/json'},
      body: usuarioJson);

  if (response.statusCode == 200) {
    return true;
  }

  return false;
}

