

import '../local/local_data.dart';

class HeaderHelper {

  Future<Map<String, String>> setHeader(LocalData localData) async {
    Map<String, String> headersMap = <String, String>{};
    headersMap["token"] = await localData.getPref(LocalData.accessToken);
    //headersMap["Content-type"] = "application/json";
    return headersMap;
  }

  Map<String, String> setGeneralHeader() {

    Map<String, String> headersMap = <String, String>{};
    headersMap["Accept"] = "application/json";

    return headersMap;

  }

  Future<Map<String, String>> setAuthorizationHeader(LocalData localData) async {
    Map<String, String> headersMap = <String, String>{};
    var result = await localData.getPref(LocalData.accessToken);
    headersMap["Authorization"] = "Bearer $result";
    return headersMap;
  }

  Future<Map<String, String>> setAuthorizationHeaderWithoutBearer(LocalData localData) async {
    Map<String, String> headersMap = <String, String>{};
    var result = await localData.getPref(LocalData.accessToken);
    headersMap["Authorization"] =  result;
    return headersMap;
  }

  Future<Map<String, String>> setUrlencodedHeader(LocalData localData) async {
    Map<String, String> headersMap = <String, String>{};
    headersMap["Content-Type"] = "application/x-www-form-urlencoded";
    var result = await localData.getPref(LocalData.accessToken);
    headersMap["Authorization"] = "Bearer $result";
    return headersMap;

  }
}