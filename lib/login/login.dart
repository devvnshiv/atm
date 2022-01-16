
import 'package:auth/appcolor.dart';
import 'package:auth/login/logincontroller.dart';
import 'package:auth/signup/regester.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Resposive.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GetBuilder< LoginController>(
      init:  LoginController(),
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: logic.key,
              child: Column(
                children: [
                  SizedBox(height: 10*AppSizeConfig.heightMultiplier!,),



                  Center(child: Text("Wellcome,",style: GoogleFonts.poppins(fontSize: 2.5*AppSizeConfig.textMultiplier!, fontWeight: FontWeight.bold,color: AppColor.dashcolor ),),
                  ),
                  SizedBox(height: 32,),

                  Center(child: Text("Login",style: GoogleFonts.poppins(fontSize: 4.0*AppSizeConfig.textMultiplier!, fontWeight: FontWeight.bold,color:Color(0xef7174d0) ),),),
                  SizedBox(height: 32,),
                  Textfiled("Email", Icons.email,logic.email,false,logic.emails, logic),
                  SizedBox(height: 32,),
                  Textfiled("Password",Icons.password, logic.password , true, logic.passwords, logic),
                  SizedBox(height: 32),
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },

                      child: Text("Sign Up ???")),
                  SizedBox(height: 32),

                  Buttons("Login",logic),
                ],
              ),
            ),
          ),
        );
      }
    );
  }


  Widget Textfiled(String hint, IconData icon,var text, bool ofsure , TextEditingController controller,LoginController controllers, ){
    return Container(
      height: 5*AppSizeConfig.heightMultiplier!,
      width: 90*AppSizeConfig.widthMultiplier!,
      child:  TextFormField(

        validator: ValidationBuilder()
            .minLength(1)
            .build(),
        controller: controller,

        obscureText: ofsure,


        onChanged: (value){

        text=value;

print(text);

        },
        decoration: InputDecoration(
            focusColor: Colors.grey,

            hintText: hint,
            icon: Icon(icon, color: AppColor.dashcolor,),
            disabledBorder: InputBorder.none

        ),
      ) ,
    );
  }

  Buttons(String name, LoginController logic){
    return GestureDetector(
      onTap: (){
        if(logic.key.currentState!.validate()){
          print(logic.email);
          logic.login();
        }

      },
      child: Container(
        height: 5*AppSizeConfig.heightMultiplier!,
        width: 90*AppSizeConfig.widthMultiplier!,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Color(0xef0124fb)
        ),
        child: Center(child: Text(name,style: GoogleFonts.openSans(fontSize: 2.5*AppSizeConfig.textMultiplier!,color: Colors.white))) ,

      ),
    );
  }


}
