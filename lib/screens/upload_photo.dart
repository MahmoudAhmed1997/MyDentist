import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File _selectedFile;
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/images/mahmoud1.jpg",
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState((){
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if(image != null){
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState((){
        _selectedFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState((){
        _inProcess = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getImageWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
                color: Colors.green,
                child: Text(
                  "Camera",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getImage(ImageSource.camera);
                }),
            MaterialButton(
                color: Colors.deepOrange,
                child: Text(
                  "Device",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getImage(ImageSource.gallery);
                })
          ],
        )
      ],
    ),);
  }
}
