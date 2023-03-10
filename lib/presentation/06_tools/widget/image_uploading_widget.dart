import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';

class ImageUploadEidget extends StatefulWidget {
  const ImageUploadEidget({super.key});

  @override
  State<ImageUploadEidget> createState() => _ImageUploadEidgetState();
}

class _ImageUploadEidgetState extends State<ImageUploadEidget> {
  XFile? image;

  final ImagePicker picker = ImagePicker();
  // final List<XFile>? images = [];

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    // var img = await picker.pickMultiImage();

    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: customHeight(50),
          child: ElevatedButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            child: Icon(Icons.image_outlined),
          ),
        ),

        //if image not null show the image
        //if image null show text
        image != null
            ? SizedBox(
                height: customHeight(50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    //to show image, you type like this.
                    File(image!.path),
                    fit: BoxFit.cover,
                    // cacheHeight: 100,
                    // cacheWidth: 100,
                  ),
                ),
              )
            : Text(
                "ADD Image",
                style: TextStyle(fontSize: 20),
              )
      ],
    );
  }
}
