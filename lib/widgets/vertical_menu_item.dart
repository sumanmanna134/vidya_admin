// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/controllers/menu_controller.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const VerticalMenuItem({Key key, this.itemName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value){
        value ? menuController.onHovering(itemName)
            : menuController.onHovering("not hovering");

      },
      child: Obx(()=> Container(
        color: menuController.isHovering(itemName) ? lightGrey.withOpacity(.1) : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: menuController.isHovering(itemName) ||
            menuController.isActive(itemName),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 3,
                height: 27,
                color: Colors.white,
              ),
            ),
            Expanded(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child:menuController.returnIconFor(itemName),
                  ),
                  if(!menuController.isActive(itemName))
                    Flexible(child: CustomText(text: itemName,
                    color: menuController.isHovering(itemName)? Colors.white : lightGrey,
                    ),)
                  else
                    Flexible(
                        child: CustomText(text: itemName,
                          color: Colors.white,
                          size: 18,
                          weight: FontWeight.bold
                          ,)

                    )
                ],
              ),
            ))
          ],
        ),
      ))

    );
  }
}
