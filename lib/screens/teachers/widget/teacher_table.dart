//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/model/teacher_model.dart';
import 'package:vidya_admin/routing/routes.dart';
import 'package:vidya_admin/screens/teachers/create_teacher.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
import 'package:get/get.dart';

class TeacherListTable extends StatelessWidget {
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
          StreamBuilder<QuerySnapshot>(
            stream: authController.retrieveTeachers(),
            builder: (context, snapshot){
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
                    rows:List.generate(snapshot.data.docs.length, (index) {
                      Map<String, dynamic> teacherinfo = snapshot.data.docs[index].data();

                      Teacher teacher = Teacher.fromJson(teacherinfo);
                      return DataRow(cells: [
                        DataCell(CustomText(text: "${teacher.name}")),
                        DataCell(CustomText(text: "${teacher.email}")),
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
                              text: "${teacher.phone}",
                            )
                          ],
                        )),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: "Delete Teacher",
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                            ))),
                      ]);
                    })

                );

              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          )

        ],
      ),
    );
  }
}