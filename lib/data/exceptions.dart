import 'package:flutter_bloc_first/constants/app_string.dart';

class ApiException implements Exception {
  @override
  String toString() {
    return CommonString.ERROR_MESSAGE;
  }
}
