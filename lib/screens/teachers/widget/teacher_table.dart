//@dart=2.9
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vidya_admin/constants/api_constant.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/helpers/show_loading.dart';
import 'package:vidya_admin/model/alluser_model.dart';
import 'package:vidya_admin/model/teacher_model.dart';
import 'package:vidya_admin/routing/routes.dart';
import 'package:vidya_admin/screens/teachers/create_teacher.dart';
import 'package:vidya_admin/services/api.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:vidya_admin/widgets/popup.dart';

class TeacherListTable extends StatefulWidget {
  @override
  _TeacherListTableState createState() => _TeacherListTableState();
}

class _TeacherListTableState extends State<TeacherListTable> {

  Future allUsers;
  List<Users> teachers =[];
  @override
  void initState() {
    print("init state");
    getAllTeachers();
    // TODO: implement initState

  }
  getAllTeachers(){

      allUsers = authController.retrieveTeachers();

    return allUsers;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "Active Teachers",
                color: lightGrey,
                weight: FontWeight.bold,
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){

                  authController.userModel.value.user.role!=R.RoleAdmin?
                  showWarnDialog(text: 'You Do not have Sufficient Permission to Access,\n Contact with Your Admin'):

                  navigationController.navigateTo(createTeacherPageRoute);

                },
                child: Container(
                    decoration: BoxDecoration(
                      color: light,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: active, width: .5),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    child: CustomText(
                      text: "Create Teacher",
                      color: active.withOpacity(.7),
                      weight: FontWeight.bold,
                    )),
              )
            ],
          ),
          FutureBuilder(
            future: getAllTeachers(),
            builder: (context, snapshot){
              if(snapshot.hasError) return showSnackBar(title: "Error", text: "Something Went Wrong");
              switch(snapshot.connectionState){
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Center(child: Text("Fetching.."),);
                case ConnectionState.done:
                  if(snapshot.hasData){
                    return DataTable2(
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        minWidth: 600,
                        columns: [
                          DataColumn2(
                            label: Text("Name"),
                            size: ColumnSize.L,
                          ),
                          DataColumn(
                            label: Text('Email'),
                          ),
                          DataColumn(
                            label: Text('Phone'),
                          ),
                          DataColumn(
                            label: Text('Action'),
                          ),
                        ],
                        rows:authController.teachers.isEmpty?Container(
                          child: Center(child: Text("No Data Available"),),
                        ):
                        List.generate(authController.teachers.length, (index) {

                          return DataRow(cells: [
                            DataCell(CustomText(text: "${authController.teachers[index].name}")),
                            DataCell(CustomText(text: "${authController.teachers[index].email}")),
                            DataCell(Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.lightGreen,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  text: "${authController.teachers[index].phone}",
                                )
                              ],
                            )),
                            DataCell(
                                authController.userModel.value.user.role==R.RoleAdmin &&
                                    authController.teachers[index].id!=authController.userModel.value.user.id?
                                InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: light,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: active, width: .5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      child: CustomText(
                                        text: authController.teachers[index].isDisable ? "Unblock" : "Block",
                                        color: active.withOpacity(.7),
                                        weight: FontWeight.bold,
                                      )),
                                  onTap: ()async{
                                    print(authController.teachers[index].email);
                                    showLoading();
                                    var value = authController.teachers[index].isDisable?false:true;

                                    await authController.blockUser(email: authController.teachers[index].email, isDisable: value)
                                        .then((value) {
                                      authController.retrieveTeachers();
                                      dismissLoadingWidget();
                                    });


                                    setState(()  {
                                    });

                                    print("onTap");



                                  },
                                ):
                                InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: light,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: active, width: .5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      child: CustomText(
                                        text: "View",
                                        color: active.withOpacity(.7),
                                        weight: FontWeight.bold,
                                      )),
                                  onTap: (){
                                    print(authController.teachers[index].email);



                                  },
                                )
                            ),
                          ]);
                        })

                    );

                  } else Center(child: Text("No Data Found !"),);


              }
              return Center(child: Text(""),);
            },
          )

        ],
      ),
    );
  }
}