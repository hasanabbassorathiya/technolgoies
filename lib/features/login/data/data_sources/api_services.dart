import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:technology_test/constants.dart';
import 'package:technology_test/features/login/data/models/user_model.dart';

class ApiServices with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  UserModel _model = UserModel();

  UserModel get model => _model;

  set model(UserModel value) {
    _model = value;
  }

  static Dio dio = Dio();

  update({bool isLoading = false}) {
    notifyListeners();
    return _isLoading = isLoading;
  }

  Future<UserModel> getUser({
    required String email,
    required String password,
  }) async {
    debugPrint({
      'email': email.trim(),
      'password': password,
    }.toString());
    debugPrint(kLoginUrl.toString());

    _isLoading = true;
    try {
      var response = await dio.post(
        kLoginUrl,
        options: Options(headers: {
          'application': 'x-www-form-urlencoded',
        }),
        data: {
          'email': email.trim(),
          'password': password,
        },
      );
      debugPrint(response.data.toString());
      model = userModelFromJson(
        jsonEncode(
          response.data,
        ),
      );
      debugPrint(model.message.toString());
      _isLoading = false;
      return model;
    } on DioError catch (e) {
      _isLoading = false;
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint(e.response?.data.toString());
        debugPrint(e.response?.headers.toString());
        debugPrint(e.response?.requestOptions.toString());
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
    }
    _isLoading = false;
    return model;
  }
}
