import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = "https://miapp.itying.com/";
  static Dio dio = Dio();
  HttpsClient() {
    dio.options.baseUrl = domain;
    // dio.options.connectTimeout = 5000 as Duration; //5s
    // dio.options.receiveTimeout = 5000 as Duration;
  }

  Future get(apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static replaceUri(picUrl) {
    String tempUrl = domain + picUrl;
    return tempUrl.replaceAll("\\", "/");
  }
}
