// @dart=2.9
import 'package:flutter/material.dart';
import 'package:vidya_admin/helpers/ResponsiveWidget.dart';
import 'package:vidya_admin/widgets/vertical_menu_item.dart';

import 'horizontal_menu.dart';
class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const SideMenuItem({Key key, this.itemName, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(ResponsiveWidget.isCustomSize(context)){
      return VerticalMenuItem(itemName: itemName,onTap:onTap,);
    }
    else{
      return HorizontalMenuItem(itemName: itemName,onTap:onTap,) ;
    }
  }
}
