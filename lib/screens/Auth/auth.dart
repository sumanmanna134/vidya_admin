
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/widgets/custom_text.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(24),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Form(
                key: authController.loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Welcome back to the admin panel.",
                    color: lightGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: authController.email,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@domain.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onSaved: (value){
                  authController.email.text=value;
                },
                validator: (value){
                  return authController.validateEmail(value);
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                controller: authController.password,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "************",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onSaved: (value){
                  authController.password.text = value;
                },
                validator: (value){
                  return authController.validatePassword(value);
                },
              ),
              SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Checkbox(value: true, onChanged: (value){}),
              //         CustomText(text: "Remeber Me",),
              //       ],
              //     ),
              //
              //     CustomText(
              //         text: "Forgot password?",
              //         color: active
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              InkWell(
                onTap: (){

                  print("HLogin");
                  authController.checkLogin();
                  // Get.offAllNamed(rootRoute);
                },
                child: Container(
                  decoration: BoxDecoration(color: active,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Login",
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Do not have admin credentials? "),
                    TextSpan(text: "Request Credentials! ", style: TextStyle(color: active))
                  ]
              ))

            ],
          ),
        ),
      ),
    );
  }
}