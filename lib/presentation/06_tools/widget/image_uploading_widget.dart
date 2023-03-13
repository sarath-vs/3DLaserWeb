import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';
import 'package:file_picker/file_picker.dart';

import '../../../application/tools_controller/tools_controller.dart';

class ImageUploadEidget extends StatefulWidget {
  const ImageUploadEidget({super.key});

  @override
  State<ImageUploadEidget> createState() => _ImageUploadEidgetState();
}

class _ImageUploadEidgetState extends State<ImageUploadEidget> {
  String selctFile = '';
  XFile? image;
  Uint8List? selectedImageInBytes;
  List<Uint64List> pickedImagesInBytes = [];
  List<String> imageUrls = [];
  var filePath = '';
  String? selectfilepath;
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

  _selectFile(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) {
      selctFile = fileResult.files.first.name;
      selectfilepath = fileResult.files.first.identifier;

      setState(() {
        // pickedImagesInBytes.add(element.bytes);
        selectedImageInBytes = fileResult.files.first.bytes;
        // imageCounts += 1;
      });
    }
    String base64String = base64.encode(selectedImageInBytes!);
    List<int> bytes = utf8.encode(base64String);
    String byteString = base64.encode(bytes);
    // File imgFile = File(selctFile);
    Get.find<ToolsController>().filepath = fileResult;
    print("*******");
    print(selctFile);
    print("********");
    // // print(imgFile);
    // print(selectedImageInBytes);
    print("************/////////////////");
    print(byteString.toString());
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
              print("pressed");
              // getImage(ImageSource.camera);
              _selectFile(true);
            },
            child: Icon(Icons.image_outlined),
          ),
        ),

        //if image not null show the image
        //if image null show text
        selctFile != ''
            ? SizedBox(
                height: customHeight(50),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(selectedImageInBytes!)
                    //  Image.file(
                    //   //to show image, you type like this.
                    //   File(image!.path),
                    //   fit: BoxFit.cover,
                    //   // cacheHeight: 100,
                    //   // cacheWidth: 100,
                    // ),
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
