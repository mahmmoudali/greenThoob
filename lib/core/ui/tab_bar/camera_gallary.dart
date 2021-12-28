import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ojos_app/core/localization/translations.dart';
import 'package:ojos_app/core/res/global_color.dart';
import 'package:ojos_app/core/res/text_style.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
   String _imgPath="";
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                  _ImageView(_imgPath),
              SizedBox(height: 25.h,),

              RaisedButton(
                  onPressed: _takePhoto,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('صـورة'),
                      SizedBox(width: 8.w,),
                      Icon(Icons.camera_alt),
                    ],
                  ),
              ),
          SizedBox(height: 15.h,),
          RaisedButton(
              onPressed: _openGallery,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('حـدد صـورة'),
                  SizedBox(width: 8.w,),
                  Icon(Icons.photo_library),
                ],
              ),
    ),
    ],
    ),
    ),
        ));
  }

  // / * التحكم بالصورة * /
  Widget _ImageView(imgPath) {
    if (imgPath == "") {
      return Center(
        child: Text(
          Translations.of(context)
              .translate('bill_head'),
          style: textStyle
              .bigTSBasic
              .copyWith(
            color: globalColor.primaryColor,
            fontWeight:
            FontWeight.w600,
          ),
        ),
      );
    } else {
    return Image.file(
    File(imgPath),
    );
    }
  }


//التقط صوره

  _takePhoto() async {
    var image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image!.path;
    });
  }

  // / * ألبوم * /
  _openGallery() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image!.path;
    });
  }
}


