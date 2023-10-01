abstract class RemoteModule {

  Future<dynamic> getResponse(String baseUrl,String pathUrl, RequestType requestType, {
    Map<String,dynamic> body = const {}, Map<String, String> headers = const {},
    bool isQueryParams = false
  });

}

enum RequestType {
  get,
  post,
  put,
  delete
}