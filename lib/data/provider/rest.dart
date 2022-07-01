import 'package:dio/dio.dart';
import 'package:flutter_bloc_first/constants/index.dart';

import '../exceptions.dart';

const baseUrl = ConfigApi.BASEURL;
const appKey = ConfigApi.APPKEY;
const version = ConfigApi.VERSION;
const option = ConfigApi.OPTION;

class RestAPIClient {
  var httpClient = Dio();
  Map<String, dynamic> _defaultBody = {
    'app_key': appKey,
    'ver': version,
    'op': option,
  };

  RestAPIClient();

  post(Map<String, dynamic> postData) async {
    try {
      Map<String, dynamic> submit = Map<String, dynamic>();
      submit.addAll(_defaultBody);
      submit.addAll(postData);
      var response = await httpClient.post(
        baseUrl,
        data: submit,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      return response.data;
    } catch (exception) {
      throw ApiException();
    }
  }

  postFile(Map<String, dynamic> postData) async {
    try {
      Map<String, dynamic> submit = Map<String, dynamic>();
      submit.addAll(_defaultBody);
      submit.addAll(postData);

      final FormData formData = FormData.fromMap(submit);
      var response = await httpClient.post(baseUrl, data: formData);
      return response.data;
    } catch (exception) {
      throw ApiException();
    }
  }

  get(String url) async {
    try {
      var response = await httpClient.get(
        url,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      return response.data;
    } catch (exception) {
      throw ApiException();
    }
  }
}
