import 'package:flutter/material.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/routing/routes.dart';
import 'package:vidya_admin/screens/books/book_manager.dart';
import 'package:vidya_admin/screens/overview/overview.dart';
import 'package:vidya_admin/screens/teachers/create_teacher.dart';
import 'package:vidya_admin/screens/teachers/teacher_manager.dart';
Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case overviewPageRoute:
      return _getPageRoute(Overview());
    case teachersPageDisplayRoutes:
      return _getPageRoute(TeacherManager());
    case booksPageRoute:
      return _getPageRoute(BooksManager());
    case createTeacherPageRoute:
      return _getPageRoute(CreateTeacher());
    default:
      return _getPageRoute(Overview());
  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}