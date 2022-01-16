
import 'dart:io';

import 'package:auth/landingpage/landingpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LoginController extends GetxController{
 GlobalKey<FormState> key = GlobalKey<FormState>();

String email= "" ;
String password= "" ;
TextEditingController emails = TextEditingController();
TextEditingController passwords = TextEditingController();
 TextEditingController emailsr = TextEditingController();
 TextEditingController passwordsr= TextEditingController();
 TextEditingController name = TextEditingController();
 TextEditingController rfdnumber = TextEditingController();


 FirebaseAuth auth = FirebaseAuth.instance;
File? file;
 final ImagePicker picker = ImagePicker();
 FirebaseFirestore firestore = FirebaseFirestore.instance;


login() async{
print(email);
Get.dialog(
  AlertDialog(
    title: Text("Loading......"),

    actions: <Widget>[
      Center(child: CircularProgressIndicator())
    ],
  ),
  barrierDismissible: false,
);
 var id = await auth.signInWithEmailAndPassword(email: emails.text, password:passwords.text).catchError((e){
   Get.back();
   Get.snackbar(
     "Invalid password or Email Id",
    "",
     icon: Icon(Icons.error, color: Colors.red),
     snackPosition: SnackPosition.BOTTOM,

   );
 });







   storePerfernce(id.user!.uid);
Get.back();
Get.to(CameraApp());



}

storePerfernce(String id) async {
  emailValidations(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value.length == 0) {
      return "email rewuried";
    }
    if (!regex.hasMatch(value))
      return "email requrid";
    else
      return '';
  }


}

takeimage() async{
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  print(photo!.path);
  file = File(photo.path);
  update();

}

regester() async{
  Get.dialog(
    AlertDialog(
      title: Text("Loading......"),

      actions: <Widget>[
        Center(child: CircularProgressIndicator())
      ],
    ),
    barrierDismissible: false,
  );

var id = await auth.createUserWithEmailAndPassword(email: emailsr.text, password: passwordsr.text).catchError((e){
  Get.back();
  Get.snackbar(
    "Invalid password or Email Exist",
    "",
    icon: Icon(Icons.error, color: Colors.red),
    snackPosition: SnackPosition.BOTTOM,

  );
});
;

var string =await FirebaseStorage.instance.ref('/${emailsr.text}').putFile(file!);



print(string.ref.fullPath);



firestore.collection("user").doc(id.user!.uid).set({
  "name":name.text,
  "email":emailsr.text,
  "rfid":rfdnumber.text,
  "imageurl":string.ref.fullPath,
  "uid":id.user!.uid

}).then((value){
  Get.back();
  Get.to(CameraApp());
});

}



}