// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:laser_tech_app/domain/responsive/dimensions.dart';
// import 'package:file_picker/file_picker.dart';

// class ImageUploadquestions extends StatefulWidget {
//   const ImageUploadquestions({super.key});

//   @override
//   State<ImageUploadquestions> createState() => _ImageUploadquestionsState();
// }

// class _ImageUploadquestionsState extends State<ImageUploadquestions> {
//   String selctFile = '';
//   XFile? image;
//   Uint8List? selectedImageInBytes;
//   List<Uint8List> pickedImagesInBytes = [];
//   List<String> imageUrls = [];
//   var filePath = '';
//   String? selectfilepath;
//   String base64String = '';
//   final ImagePicker picker = ImagePicker();
//   int imageCounts = 0;
//   // final List<XFile>? images = [];

//   //we can upload image from camera or from gallery based on parameter

//   _selectFile(bool imageFrom) async {
//     FilePickerResult? fileResult = await FilePicker.platform
//         .pickFiles(allowMultiple: true, type: FileType.image);

//     if (fileResult != null) {
//       selctFile = fileResult.files.first.name;
//       fileResult.files.forEach((element) {
//         setState(() {
//           pickedImagesInBytes.add(element.bytes as Uint8List);
//           //selectedImageInBytes = fileResult.files.first.bytes;
//           imageCounts += 1;
//         });
//       });
//     }
//     print(selctFile);
//     print(pickedImagesInBytes);
//   }

//   // _selectFile(bool imageFrom) async {
//   //   FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

//   //   if (fileResult != null) {
//   //     selctFile = fileResult.files.first.name;
//   //     selectfilepath = fileResult.files.first.identifier;

//   //     setState(() {
//   //       pickedImagesInBytes.add(element.bytes);
//   //       selectedImageInBytes = fileResult.files.first.bytes;
//   //       base64String = base64.encode(selectedImageInBytes!);
//   //       imageCounts += 1;
//   //     });
//   //   }

//   // List<int> bytes = utf8.encode(base64String);
//   // String byteString = base64.encode(bytes);
//   // File imgFile = File(selctFile);
//   // Get.find<ToolsController>().filepath = base64String;
//   // print("*******");
//   // print(selctFile);
//   // print("********");
//   // print("*********" + base64String + "**********");
//   // print(selectedImageInBytes);
//   // print("************/////////////////");
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: customHeight(50),
//           child: ElevatedButton(
//             onPressed: () {
//               print("pressed");
//               // getImage(ImageSource.camera);
//               _selectFile(true);
//             },
//             child: Icon(Icons.image_outlined),
//           ),
//         ),

//         //if image not null show the image
//         //if image null show text
//         selctFile != ''
//             ? SizedBox(
//                 height: customHeight(50),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.memory(selectedImageInBytes!)
//                     //  Image.file(
//                     //   //to show image, you type like this.
//                     //   File(image!.path),
//                     //   fit: BoxFit.cover,
//                     //   // cacheHeight: 100,
//                     //   // cacheWidth: 100,
//                     // ),
//                     ),
//               )
//             : Text(
//                 "ADD Image",
//                 style: TextStyle(fontSize: 20),
//               )
//       ],
//     );
//   }
// }
