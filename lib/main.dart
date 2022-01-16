
import 'package:auth/landingpage/landingpage.dart';
import 'package:auth/signup/regester.dart';
import 'package:auth/splahscreen/splashscreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Resposive.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, oriantion) {
        AppSizeConfig().init(constraints, oriantion);
        return
          GetMaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // This is the theme of your application.sss
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.grey,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home:Regester() ,
          );
      }
      );
    }
    );
  }
}