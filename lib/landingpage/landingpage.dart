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
    getnmap ();
    // TODO: implement initState
    super.initState();
  }

  getnmap () async{
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
