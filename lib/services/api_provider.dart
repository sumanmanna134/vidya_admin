
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vidya_admin/constants/api_constant.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/helpers/storage.dart';
import 'package:vidya_admin/model/alluser_model.dart';
import 'package:vidya_admin/screens/Auth/auth.dart';
import 'package:vidya_admin/widgets/popup.dart';

import 'exception.dart';
class ApiBaseHelper{
  Map<String, String> headers = {"x-access-token":StorageUtil.getString(R.authToken)};

  Future get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url),headers: headers);
      responseJson = _returnResponse(response);

    }on SocketException {
      showSnackBar(title: 'Offline', text: 'No Internet Connection!');
    }on UnauthorisedException{
      Get.offAll(AuthenticationPage());
    }
    return responseJson;


  }

  Future post({required String url, required var data }) async {
    var responseJson;
    try {
      print(url);
      print(data.runtimeType);
      final response = await http.post(Uri.parse(url),headers: headers , body: data);
      responseJson = _returnResponse(response);
      print("RESPONSE");
      print(responseJson.toString());

    }on SocketException {
      showSnackBar(title: 'Offline', text: 'No Internet Connection!');
    }on UnauthorisedException{
      Get.offAll(AuthenticationPage());
    }
    return responseJson;


  }




  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 402:
        throw AccountBlockException(response.body.toString());
      case 403:
        throw DataNotFoundException(response.body.toString());
      case 500: throw DataNotFoundException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }

  }
}