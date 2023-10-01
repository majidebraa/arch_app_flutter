import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:arch_app_flutter/data/remote/remote_module.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../core/utility.dart';
import '../local/local_data.dart';
import 'app_exception.dart';
import 'const_helper.dart';

class RemoteModuleImpl extends RemoteModule {
  final LocalData localData;
  RemoteModuleImpl({required this.localData});
  @override
  Future getResponse(String baseUrl, String pathUrl, RequestType requestType, {
    Map<String,dynamic> body = const {}, Map<String, String> headers = const {},
    bool isQueryParams = false }) async {
    var url = baseUrl + pathUrl;
    Utility.printLog("body$body");
    Utility.printLog("headers$headers");
    Utility.printLog("url$url");
    Response response;
    dynamic responseJson;
    try {
      switch(requestType){
        case RequestType.get:
          response = await get(Uri.parse(url), headers: headers)
              .timeout( const Duration(seconds: connectionTimeOut));
          break;
        case RequestType.post:
          if (isQueryParams) {
            var urlQuery = Uri.http(
                baseUrlWithOutHTTP, "/$pathUrl", body);
            Utility.printLog("urlQuery$urlQuery");
            response = await post(urlQuery, headers: headers)
                .timeout(const Duration(seconds: connectionTimeOut));
          } else {
            Utility.printLog("url$url");
            response = await post(Uri.parse(url), body: body,
                headers: headers).timeout(const Duration(seconds:
            connectionTimeOut));
          }
          break;
        case RequestType.put:
          response = Response("{}", 400);
          break;
        case RequestType.delete:
          response = Response("{}", 400);
          break;
      }

      responseJson = returnResponse(response, baseUrl,pathUrl,requestType, body,headers,
          isQueryParams);
      return responseJson;
    }on TimeoutException catch (e) {
      // handle timeout
      Utility.printLog(
          "response_error${e.toString()}");
      throw FetchDataException('Time Out');
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response,String baseUrl, String pathUrl, RequestType requestType,
    Map<String,dynamic> body, Map<String, String> headers, bool isQueryParams) async {
    Utility.printLog("response.statusCode${response.statusCode}");
    Utility.printLog("response.body${utf8.decode(response.bodyBytes)}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 409:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code :'
                ' ${response.statusCode}');
    }
  }
}
