// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/controllers/menu_controller.dart';
import 'package:vidya_admin/screens/Auth/auth.dart';
import 'package:vidya_admin/site_layout.dart';

import 'controllers/navigation_controller.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
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
      home: SiteLayout(),

    );
  }
}


