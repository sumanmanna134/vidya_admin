// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';

import 'custom_text.dart';
class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const HorizontalMenuItem({Key key, this.itemName, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      onHover: (value){
        value ? menuController.onHovering(itemName)
            : menuController.onHovering("not hovering");
      },

      child: Obx(()=> Container(
        color: menuController.isHovering(itemName) ? 
        lightGrey : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: menuController.isHovering(itemName) ||
                  menuController.isActive(itemName),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 6,
                height: 40,
                color: light,
              ),
            ),
            SizedBox(width: _width/88,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: menuController.returnIconFor(itemName),
            ),
            if(!menuController.isActive(itemName))
              Flexible(child: CustomText(text: itemName , color: menuController.isHovering(itemName) ? dark : lightGrey,))
            else
              Flexible(child: CustomText(text: itemName , color:  Colors.white, size: 18, weight: FontWeight.bold,))
            
          ],
        ),
      )),
    );
  }
}
