import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  final ImagePicker picker = ImagePicker();

  @override
  void initState()  {

    // TODO: implement initState
    super.initState();
  }

  getnmap () async{
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          getnmap ();
        },
        child: Center(
          child: Container(
            height: 40,
            width: 100,
            color: Colors.red,
            child: Center(child: Text("Authorize", style: TextStyle(color: Colors.white),)),
          ),
        ),
      ),

    );
  }
}
