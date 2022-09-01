import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

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

Future<UsuarioAPI?> cadastroUsuario() async {
  final Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String clienteJson = jsonEncode(
      {"username":"caiov","password":"123456","gender":"male","name":"caiov","birthdate":"2010-08-03","age":12});

  final Response response = await client.post(
      Uri.http('127.0.0.1:8000', '/cadastro/'),
      headers: {'Content-type': 'application/json'},
      body: clienteJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  if(response.statusCode == 400){
    return null;
  }


  return UsuarioAPI(json['name'], json['username'], json['gender'], json['age'],
      json['birthdate']);
}
