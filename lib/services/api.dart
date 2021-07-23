//@dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:vidya_admin/constants/api_constant.dart';
import 'package:vidya_admin/helpers/show_loading.dart';
import 'package:vidya_admin/helpers/storage.dart';
import 'package:vidya_admin/model/alluser_model.dart';
import 'package:vidya_admin/model/blocUser.dart';
import 'package:vidya_admin/model/blockModel.dart';
import 'package:vidya_admin/model/errorModel.dart';
import 'package:vidya_admin/model/user_model.dart';
import 'dart:html' as html;

import 'package:vidya_admin/services/api_provider.dart';
class Api{

  static var _client = http.Client();
  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();



  static   Map<String, String> headers = {"x-access-token":StorageUtil.getString(R.authToken)};

  // static _cookieStorage(var token) {
  //   var f = DateFormat('E, d MMM yyyy HH:mm:ss');
  //   var expire = f.format(((DateTime.now()).add(Duration(days: 7))).toUtc()) + " GMT";
  //
  //   html.window.document.cookie= "token=$token; expires=${expire.toString()}";
  //
  // }




  static Future login({@required String email,@required String password})async{

    final response = await _client.post(Uri.parse(ApiConstant.loginUrl)
        , body: {"email": email, "password": password});

    var json = response.body;

    if(response.statusCode == 200){
      User user = userFromJson(json);
      return user;

    }else{

      ErrorModel errorModel = errorModelFromJson(json);
      return errorModel;
    }





  }



  static Future getMyProfile()async{
    try{

      final response = await _client.get(Uri.parse(ApiConstant.myProfile) , headers: {
        "x-access-token":StorageUtil.getString(R.authToken)
      });
      var json = jsonDecode(response.body);
      if(response.statusCode == 200 ){
        return User.fromJson(json);
      }else{
        print("error");
        
        ErrorModel errorModel= ErrorModel.fromJson(json);
        return errorModel;
      }

    }catch(e){
      // print(e);
    }


  }

  Future getAllUsers()async{
    try{
      final response = await _apiBaseHelper.get(ApiConstant.allUsers);
      return AllUserModel.fromJson(response);
    }catch(e){
      // print(e);
    }
  }

  Future userBlock({@required String email,@required bool isDisable}) async {
    try{
      final response = await _apiBaseHelper.post(url: ApiConstant.block,
          data: BlockUser(email: email, block: isDisable.toString()).toJson());
      print(response);
      // return BlockModel.fromJson(response);
    }catch(e){
      // print(e);
    }
  }



  static Future<bool> logout() async{
    final response = await _client.post(Uri.parse(ApiConstant.logout), headers: headers);
    print(response.body);
    var json = jsonDecode(response.body);
    if(response.statusCode==200 && json["success"]){
      StorageUtil.clear();

      return json["success"];
    }
    else{
      return false;
    }

  }



}