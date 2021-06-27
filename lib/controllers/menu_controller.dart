
// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/routing/routes.dart';

class MenuController extends GetxController{
  static MenuController instance = Get.find();
  var activeItem = overviewPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName){
    activeItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;
  onHovering(String itemName){
    if(!isActive(itemName)) return hoverItem.value == itemName;
  }




  Widget returnIconFor(String itemName){
    switch(itemName){
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case teachersPageDisplayName:
        return _customIcon(Icons.emoji_people_rounded, itemName);
      case booksPageDisplayName:
        return _customIcon(Icons.library_books, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon,String itemName){
    if(isActive(itemName)) return Icon(icon, size: 22, color: dark);
    return Icon(
      icon, color: isHovering(itemName) ? dark:lightGrey,
    );
  }





}