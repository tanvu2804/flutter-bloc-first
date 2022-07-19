import 'package:flutter_bloc_first/data/adapters/repository_adapter.dart';
import 'package:flutter_bloc_first/data/provider/rest.dart';

class ApiServiceRepository implements IApiDeviceRepository {
  RestAPIClient _restAPIClient = RestAPIClient();

  ApiServiceRepository();

  @override
  Future<Map<String, dynamic>?> listNews() async {
    try {
      final response = await _restAPIClient.get("/news");
      if (response != null) {
        return response;
      }
    } catch (exception) {
      return Future.error(exception);
    }
  }

  @override
  Future<Map<String, dynamic>?> listVideo() async {
    try {
      final response = await _restAPIClient.get("/video");
      if (response != null) {
        return response;
      }
    } catch (exception) {
      return Future.error(exception);
    }
  }
}
