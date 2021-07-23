import 'package:flutter/material.dart';
import 'package:get/get.dart';
showWarnDialog({required String text}){
  Get.defaultDialog(
    backgroundColor: Colors.red,
    title: "Access Denied",
    titleStyle: TextStyle(color: Colors.white),
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.warning_amber_outlined, color: Colors.white,),
        ),
        SizedBox(width: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: TextStyle(color: Colors.white),),
        )
      ],
    )

  );
}

showSnackBar({required String title, required String text}){
  return Get.snackbar(title, text);
}

