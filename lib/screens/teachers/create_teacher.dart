import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/helpers/ResponsiveWidget.dart';
import 'package:vidya_admin/screens/teachers/widget/create_teacher_widget.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
class CreateTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()=> Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context)?56:6),
              child: CustomText(text: menuController.activeItem.value, size: 24, weight: FontWeight.bold,),
            )
          ],
        )),
        Expanded(
            child: CreateTeacherWidget())
      ],
    );
  }
}
