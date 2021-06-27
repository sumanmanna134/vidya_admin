import 'package:flutter/cupertino.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/routing/router.dart';
import 'package:vidya_admin/routing/routes.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  onGenerateRoute: generateRoute,
  initialRoute: overviewPageRoute,
);