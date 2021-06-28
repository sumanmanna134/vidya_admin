//@dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/constants/firebase.dart';
import 'package:vidya_admin/helpers/show_loading.dart';
import 'package:vidya_admin/model/teacher_model.dart';
import 'package:vidya_admin/routing/routes.dart';
import 'package:vidya_admin/screens/Auth/auth.dart';
import 'package:vidya_admin/site_layout.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();
  Rx<User> firebaseUser  = new Rx<User>(null);
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController primaryAddress = TextEditingController();
  TextEditingController presentAddress = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();

  String teacherCollection = "teachers";
  Rx<Teacher> teacherModel = Teacher().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) {
    if(user == null){
      Get.offAll(AuthenticationPage());
      dismissLoadingWidget();


    }else{
      firebaseUser.value = user;
      Get.offAll(SiteLayout());
      _initializeUserModel(firebaseUser.value.uid);
      print("Logged in");
    }
  }

void signIn()async{
    try{
      showLoading();
      await auth.signInWithEmailAndPassword(email: email.text.trim(),
          password: password.text.trim()).then((result) {
            String _userId = result.user.uid;
            _initializeUserModel(_userId);
            _clearControllers();
            dismissLoadingWidget();
            updateOnlineStatus(true);
            Get.snackbar("Success", "Successfully Login", backgroundColor: Colors.green , colorText: Colors.white );

      });
    }catch(e){
      debugPrint(e.toString());
      dismissLoadingWidget();
      Get.snackbar("Failed to SignIn", "Try again" , duration: Duration(seconds: 5),  backgroundColor: Colors.red , colorText: Colors.white);
    }
}

Future signOut() async {
    updateOnlineStatus(false);
    auth.signOut();
    return Future.delayed(Duration.zero);
  }
void signUp()async{
    showLoading();
    try{
      await auth.createUserWithEmailAndPassword(email: email.text.trim(),
          password: password.text.trim()).then((result) {

            String _userId = result.user.uid;
            _addUserToFirestore(_userId);
            _initializeUserModel(_userId);
            updateOnlineStatus(true);
            Get.snackbar("Success", "Successfully Created Account", backgroundColor: Colors.green , colorText: Colors.white );
            dismissLoadingWidget();


      });
    }catch(e){

      debugPrint(e.toString());
      dismissLoadingWidget();
      Get.snackbar("Failed to Create Account", "Try again" , duration: Duration(seconds: 5),  backgroundColor: Colors.red , colorText: Colors.white);

    }
}

_addUserToFirestore(String userId){
    firebaseFirestore.collection(teacherCollection).doc(userId).set(
      Teacher(
        name: name.text.trim(),
        email: email.text.trim(),
        phone: phone.text,
        password: password.text.trim(),
        presentAddress: presentAddress.text.trim(),
        primaryAddress: primaryAddress.text.trim(),
        pincode: pincode.text,
        state: state.text.trim(),


      ).toJson()
    );
}

_initializeUserModel(String userId)async{
    teacherModel.value = await firebaseFirestore
        .collection(teacherCollection)
        .doc(userId)
        .get()
        .then((doc) => Teacher.fromSnapshot(doc));
}

_clearControllers(){
    name.clear();
    email.clear();
    phone.clear();
    password.clear();
    primaryAddress.clear();
    presentAddress.clear();
    pincode.clear();
    state.clear();
}

  Stream<QuerySnapshot> retrieveTeachers() {
    Stream<QuerySnapshot> myTeachers = firebaseFirestore.collection(teacherCollection).snapshots();

    return myTeachers;
  }

  updateOnlineStatus(bool status){
    try {
      firebaseFirestore.collection(teacherCollection)
          .doc(firebaseUser.value.uid)
          .update({"online": status});
    }
    catch(e){
      print("user null");
    }
  }








}

