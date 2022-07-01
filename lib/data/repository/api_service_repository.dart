import 'package:flutter_bloc_first/data/adapters/repository_adapter.dart';
import 'package:flutter_bloc_first/data/provider/rest.dart';
import 'package:flutter_bloc_first/models/index.dart';

class ApiServiceRepository implements IApiDeviceRepository {
  final RestAPIClient _restAPIClient;

  ApiServiceRepository(this._restAPIClient);

  @override
  Future<NewsModel?> listNews() async {
    try {
      final response = await _restAPIClient.get(
          "https://newsapi.org/v2/everything?q=apple&from=2022-06-30&to=2022-06-30&sortBy=popularity&apiKey=00d30b24624e4b6c8610d1007acf4c6d");
      if (response != null) {
        if (response["status"] == "ok") {
          return newModelFromJson(response["articles"]);
        } else {
          throw Exception("Failed to load news");
        }
      }
    } catch (exception) {
      return Future.error(exception);
    }
  }
}
