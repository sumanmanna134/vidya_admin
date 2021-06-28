import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/constants/images.dart';
import 'package:vidya_admin/helpers/ResponsiveWidget.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
import 'package:get/get.dart';
AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key)=>
    AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: dark),

      backgroundColor: Colors.transparent,

      leading: !ResponsiveWidget.isSmallScreen(context) ?  Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 16 ),
              child:Image.asset(icLogo , width: 28,)
          )
        ],
      ): IconButton(onPressed: (){

        key.currentState!.openDrawer();
      }, icon: Icon(Icons.menu)),
      title: Obx(()=>Container(
        child: Row(
          children: [
            Visibility(
                visible: !ResponsiveWidget.isSmallScreen(context),
                child: CustomText(text: "Dashboard", color: light, size: 20, weight: FontWeight.bold,)
            ),
            Expanded(child: Container()),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.settings, color: dark,)),
            Stack(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications), color: dark.withOpacity(.7),),
                Positioned(
                  top:7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: light, width: 2)
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 1,
              height: 22,
              color: lightGrey,
            ),
            SizedBox(width: 24,),
            CustomText(text: "${authController.teacherModel.value.name}",),
            SizedBox(width: 16,),
            Container(
              decoration: BoxDecoration(
                  color: active.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)

              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: light,
                  child: Icon(Icons.person_outline, color: dark,),
                ),
              ),
            )


          ],
        ),
      )),
    );