//@dart=2.9


import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/constants/api_constant.dart';
import 'package:vidya_admin/constants/firebase.dart';
import 'package:vidya_admin/helpers/show_loading.dart';
import 'package:vidya_admin/helpers/storage.dart';
import 'package:vidya_admin/model/alluser_model.dart';
import 'package:vidya_admin/model/blockModel.dart';
import 'package:vidya_admin/model/errorModel.dart';
import 'package:vidya_admin/model/teacher_model.dart';
import 'package:vidya_admin/model/user_model.dart';
import 'package:vidya_admin/routing/routes.dart';
import 'package:vidya_admin/screens/Auth/auth.dart';
import 'package:vidya_admin/services/api.dart';
import 'package:vidya_admin/site_layout.dart';
import 'package:vidya_admin/widgets/popup.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();
  RxBool loginProcess = false.obs;
  // TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController phone = TextEditingController();
  // TextEditingController primaryAddress = TextEditingController();
  // TextEditingController presentAddress = TextEditingController();
  // TextEditingController pincode = TextEditingController();
  // TextEditingController state = TextEditingController();
  Rx<User> userModel = User().obs;
  RxList<Users> teachers =  RxList<Users>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    _setInitialScreen();

    super.onReady();
  }

  _setInitialScreen(){

    if(!_isAuthenticated()){
      Get.offAll(AuthenticationPage());
      dismissLoadingWidget();

    }else{
      Get.offAll(SiteLayout());
    }
  }

  bool _isAuthenticated(){
    var authKey = StorageUtil.getString(R.authToken , defValue: null);


    if(authKey!=null){
      getMyprofile();
      return true;
    }
    else return false;
  }



  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }

  String validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "Provide valid Email";
    }
    return null;
  }

  String validatePassword(String value){
    if(value.length<6){
      return "Password must be 6 characters";
    }

    return null;
  }

  void checkLogin(){
    final isValid = loginFormKey.currentState.validate();
    if(!isValid){
      return;
    }

    loginFormKey.currentState.save();
    login(email: email.text, password: password.text);
  }

  Future<String> login({String email, String password})async{
    try{
      showLoading();
      var loginResp = await Api.login(email: email, password: password);

      print("LOGIN RESPONSE ${loginResp.runtimeType}");
      if(loginResp!=null && loginResp is User){

        userModel.value = loginResp;
        StorageUtil.putString(R.authToken, userModel.value.token);
        dismissLoadingWidget();
        _clearControllers();
        _setInitialScreen();


      }else{
        print("ERROREEEEEEEEEEEEE");
        dismissLoadingWidget();
        Get.defaultDialog(title: "Error", barrierDismissible: true, content: Text(loginResp.errMessage));
        Get.snackbar("Failed to SignIn", "Try again" , duration: Duration(seconds: 5),  backgroundColor: Colors.red , colorText: Colors.white);
      }
    }catch(e){

      Get.snackbar("Failed to SignIn", "Try again" , duration: Duration(seconds: 5),  backgroundColor: Colors.red , colorText: Colors.white);

    }finally{
      dismissLoadingWidget();
    }
  }

  Future getMyprofile()async {

    try{
      var profile = await Api.getMyProfile();
      print(profile.runtimeType);
      if(profile is User){
        userModel.value.user = profile.user;
      }else if(profile is ErrorModel){
        Get.snackbar("${profile.message}", "login" ,isDismissible: true, backgroundColor: Colors.red , duration: Duration(seconds: 3), colorText: Colors.white);
        StorageUtil.clear();
        _setInitialScreen();

      }
    }catch(e){


      Get.snackbar("Something Went Wrong ${e.toString()}", "login" ,isDismissible: true, backgroundColor: Colors.red , colorText: Colors.white);




    }

  }

  void signOut()async{

    await Api.logout().then((value) => value?_setInitialScreen():Get.snackbar("Something Went Wrong", "login" , duration: Duration(seconds: 5),  backgroundColor: Colors.red , colorText: Colors.white));

  }

  Future<List<Users>> retrieveTeachers()async{
    try{
       var users = await Api().getAllUsers();
       if(users is AllUserModel){
         teachers.value= users.user;
       }
       return teachers;

    }catch(e){
      dismissLoadingWidget();
      Get.snackbar("Something Went Wrong ${e.toString()}", "login" ,isDismissible: true, backgroundColor: Colors.red , colorText: Colors.white);

    }

  }

  Future<BlockModel> blockUser({@required String email, @required bool isDisable})async{

    try{
      var userBlock = await Api().userBlock(email: email, isDisable: isDisable);
      print(userBlock);
      if(userBlock is BlockModel){
        Get.snackbar("Success", userBlock.message);
      }

      return userBlock;

    }catch(e){
      Get.snackbar("Something Went Wrong ${e.toString()}", "login" ,isDismissible: true, backgroundColor: Colors.red , colorText: Colors.white);

    }
  }







_clearControllers(){
    email.clear();
    password.clear();
}











}

