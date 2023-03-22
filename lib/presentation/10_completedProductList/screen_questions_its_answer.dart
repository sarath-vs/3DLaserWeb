// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../application/ansswered_product_controller/answered_product_controller.dart';
// import '../../domain/responsive/dimensions.dart';
// import '../theme/theme.dart';

// class Questionsanswer extends StatefulWidget {
//   static const routeName = 'Questionsanswer';

//   const Questionsanswer({super.key});

//   @override
//   State<Questionsanswer> createState() => _QuestionsanswerState();
// }

// class _QuestionsanswerState extends State<Questionsanswer> {
//   final List<String> imgList = [
//     'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   ];
//   int activePage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AnsweredProductController>(
//             id: Get.find<AnsweredProductController>()
//                 .answeredProductListWidgetID,
//             builder: (controller) { return Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Icon(Icons.arrow_back_ios)),
//           title: Text(
//             " Product Reivew",
//             textAlign: TextAlign.center,
//             style: AppTheme.appBarText,
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: ListView.separated(shrinkWrap: true,itemBuilder: (context,index){
//               return customVerticalGap(2);

//             }, separatorBuilder: (context,index){
//               return questionanswer(controller.answerList[index].questionEnglish!, controller.answerList[index].answer!.answer!, controller.answerList[index].answer!.image??"");
              
//             }, itemCount: controller.answerList.length)
//         )
//         );});
//   }

//   Widget questionanswer(String question, String answer,String img) {
//     return Row(
//       children: [
//         Container(
//            //height: customHeight(300),
//                      // width: customHeight(300),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 question,
//                 style: TextStyle(
//                     fontSize: customFontSize(4), fontWeight: FontWeight.bold),
//               ),
//               customVerticalGap(5),
//               Row(
//                 children: [
//                   Text(
//                     'Ans: ',
//                     style: TextStyle(
//                         fontSize: customFontSize(4), fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     answer,
//                     style: AppTheme.h3Style,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         img==''
//         ?
//          Container(
//           height: customHeight(100),
//           width: customHeight(100),
//                               margin: EdgeInsets.all(3),
//                               child: Text('No Image')
//                             ):
                            
//         Container(
//           height: customHeight(100),
//           width: customHeight(100),
//                               margin: EdgeInsets.all(3),
//                               child: Image.network(
//                                 img,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//       ],
//     );
//   }
// }
