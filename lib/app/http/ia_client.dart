import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:paula/app/http/app_exceptions.dart';

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

class IAClient {
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 20;
  Future<dynamic> post(dynamic body) async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    var uri =
        Uri.parse('https://paulaia-api-joffihckwq-uc.a.run.app/api/v1/ia1');
    var request = MultipartRequest('POST', uri);
    var multipartFile = MultipartFile.fromBytes(
      'file', // Nome do campo
      body,
      filename: 'image.jpg', // Nome do arquivo
    );
    request.files.add(multipartFile);
    try {
      var response = await request.send();
      return response.stream.bytesToString();
    } on SocketException {
      throw FetchDataException("Sem conexão com a internet", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Tente novamente mais tarde.", uri.toString());
    }
  }
}
