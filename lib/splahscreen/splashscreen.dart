import 'package:auth/Resposive.dart';
import 'package:auth/signup/regester.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 2),(){

        Get.to(( Regester()));

      });
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30*AppSizeConfig.heightMultiplier!,),

            Center(child: Image.asset('assets/img.png')),
            SizedBox(height: 5*AppSizeConfig.heightMultiplier!,),

            Text("Smart ATM", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),

      ),
    );
  }
}
