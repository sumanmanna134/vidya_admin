import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
import 'package:get/get.dart';
class CreateTeacherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
      margin: EdgeInsets.only(bottom: 30, top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: "Create Teacher",
                  color: lightGrey,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Divider(endIndent: 10,indent: 10,),

          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: "Personal Info",
                  color: lightGrey,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),

          Container(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [

                          Expanded(
                            child: TextField(

                              decoration: InputDecoration(
                                  labelText: "Name",
                                  suffixIcon: Icon(Icons.person),
                                  hintText: "ex. Bishal Mishra",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              keyboardType: TextInputType.name,
                              controller: authController.name,

                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: authController.email,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('[a-z0-9@.]')),


                              ],
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "abc@domain.com",

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [

                          Expanded(
                            child: TextField(
                              obscureText: true,
                              controller: authController.password,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "****",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: TextField(
                              controller: authController.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],

                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.call),
                                  prefixText: "+91 | ",
                                  labelText: "Phone",
                                  hintText: "9876543210",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: "Contact Info ",
                            color: lightGrey,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [

                          Expanded(
                            child: TextField(
                              controller: authController.primaryAddress,
                              decoration: InputDecoration(
                                  labelText: "Primary Address",
                                  suffixIcon: Icon(Icons.person),
                                  hintText: "ex. Bishal Mishra",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              keyboardType: TextInputType.name,

                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: TextField(
                              controller: authController.presentAddress,
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                  labelText: "Present Address",
                                  hintText: "Ex Lic more, Midnapore",

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [

                          Expanded(
                            child: TextField(
                              controller: authController.pincode,
                              maxLength: 6,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  labelText: "Pincode",
                                  hintText: "Ex 721101",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: TextField(
                              controller: authController.state,
                              maxLength: 12,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.location_on),
                                  labelText: "State",
                                  hintText: "Ex West Bengal",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          // Get.offAllNamed(rootRoute);
                          authController.signUp();
                        },
                        child: Container(
                          decoration: BoxDecoration(color: active,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CustomText(
                            text: "Create Account",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )

                  ],
                )
            ),
          ),



        ],
      ),
    );
  }


}
