// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/constants/firebase.dart';
import 'package:vidya_admin/controllers/auth_controller.dart';
import 'package:vidya_admin/controllers/menu_controller.dart';
import 'package:vidya_admin/helpers/show_loading.dart';
import 'package:vidya_admin/screens/Auth/auth.dart';
import 'package:vidya_admin/site_layout.dart';
import 'package:vidya_admin/widgets/loading.dart';

import 'binding/auth_binding.dart';
import 'controllers/navigation_controller.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AuthController());
    Get.put(MenuController());
    Get.put(NavigationController());

  });





  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows : FadeUpwardsPageTransitionsBuilder()
        }),
        primaryColor: Colors.blue
      ),
      home: Loading()

    );
  }
}





