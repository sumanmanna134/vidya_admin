import 'package:flutter/material.dart';
import 'package:vidya_admin/helpers/ResponsiveWidget.dart';
import 'package:vidya_admin/helpers/local_navigator.dart';
import 'package:vidya_admin/widgets/largeScreen.dart';
import 'package:vidya_admin/widgets/side_menu.dart';
import 'package:vidya_admin/widgets/top_nav.dart';
class SiteLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key:scaffoldKey, extendBodyBehindAppBar: true,
      extendBody: true,
      appBar:topNavigationBar(context, scaffoldKey),

      drawer: Drawer(

        child: SideMenu(),
      ),
      body: ResponsiveWidget(largeScreen: LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          ),)
    );
  }
}
