import 'package:auth/login/login.dart';

import 'package:auth/signup/regcontroller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Resposive.dart';
import '../appcolor.dart';



class Regester extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Regcontroller>(
        init:  Regcontroller(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: logic.keys,
                child: Column(
                  children: [
                    SizedBox(height: 10*AppSizeConfig.heightMultiplier!,),



                    Center(child: Text("Wellcome,",style: GoogleFonts.poppins(fontSize: 2.5*AppSizeConfig.textMultiplier!, fontWeight: FontWeight.bold,color: AppColor.dashcolor ),),
                    ),
                    SizedBox(height: 32,),

                    Center(child: Text("Register",style: GoogleFonts.poppins(fontSize: 4.0*AppSizeConfig.textMultiplier!, fontWeight: FontWeight.bold,color:Color(0xef7174d0) ),),),

                    GestureDetector(
                      onTap: (){
logic.takeimage();
                      },
                      child: CircleAvatar(
                        radius: 86,
                        child: Center(child:logic.file==null? Text(' Facephoto', maxLines: 1,):
                        Image.file(logic.file!),
                        )
                      ),
                    ),

                    SizedBox(height: 32,),
                    Textfiled("Email", Icons.email,logic.email,false,logic.emailsr, logic),
                    SizedBox(height: 32,),
                    Textfiled("Password",Icons.password, logic.password , true, logic.passwordsr, logic),
                    SizedBox(height: 32),
                    Textfiled("Rf Id",Icons.car_repair, logic.password , false, logic.rfdnumber, logic),
                    SizedBox(height: 32),
                    Textfiled("Name",Icons.supervised_user_circle_rounded, logic.password , false, logic.name, logic),
                    SizedBox(height: 32),
                    GestureDetector(
                        onTap: (){
                          Get.to(Login());
                        },

                        child: Text("Login ???")),
                    SizedBox(height: 32),
                    Buttons("Register",logic),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }


  Widget Textfiled(String hint, IconData icon,var text, bool ofsure , TextEditingController controller,Regcontroller controllers, ){
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

  Buttons(String name, Regcontroller logic){
    return GestureDetector(
      onTap: (){
        if(logic.keys.currentState!.validate()){

          logic.regester();
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
