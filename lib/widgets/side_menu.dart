// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/constants/images.dart';
import 'package:vidya_admin/helpers/ResponsiveWidget.dart';
import 'package:vidya_admin/helpers/show_loading.dart';
import 'package:vidya_admin/routing/routes.dart';
import 'package:vidya_admin/screens/Auth/auth.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
import 'package:vidya_admin/widgets/side_menu_item.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({ Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: dark,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width/48,),
                    Padding(padding: const EdgeInsets.only(right: 12) , child: Image.asset(icLogo , width: 28 ),),
                    Flexible(child: CustomText(
                      text: "Dashboard",
                      size: 20,
                      weight: FontWeight.bold,
                      color: light,
                    )),
                    SizedBox(width: _width/48,)

                  ],
                ),
                SizedBox(height: 30,),

              ],

            ),
          Divider(color: lightGrey.withOpacity(.1),),
          Column(
           mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes.map((item) => SideMenuItem(
              itemName: item.name,
              onTap: (){
                if(item.route == authenticationPageRoute){
                  showLoading();
                  authController.signOut();

                  // menuController.changeActiveItemTo(overviewPageDisplayName);

                }
                if (!menuController.isActive(item.name)) {
                  menuController.changeActiveItemTo(item.name);
                  if(ResponsiveWidget.isSmallScreen(context))
                    Get.back();
                  navigationController.navigateTo(item.route);
                }
              },
            )).toList()
          )
        ],
      ),
    );
  }
}
