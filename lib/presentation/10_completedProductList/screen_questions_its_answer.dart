import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/ansswered_product_controller/answered_product_controller.dart';
import 'package:laser_tech_app/domain/extensions/int.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';

class Questionsanswer extends GetView<AnsweredProductController> {
  static const routeName = 'Questionsanswer';

  const Questionsanswer({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;

      final id = arguments['id'];

      //final productIDZ = arguments['productName'];
      controller.updateData();
      print('---->>><<<>>>00000${controller.answerImage}');
    });

    final _widgetsList = [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ObxValue(
            (final question) => Text(
              question.value,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller.question,
          ),
          // ObxValue(
          //   (final time) => Text(
          //     '⏳ ${time.value.toMinAndSec()} Sec',
          //     textAlign: TextAlign.start,
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   controller.timeTakenToComplete,
          // ),
        ],
      ),
      Text(
        'Answers',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      ),
      ObxValue(
        (final value) {
          if (value.value != null) {
            return Text(
              'Drop Down : ${controller.answerDropDown.value}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
        controller.answerDropDown,
      ),
      ObxValue((final value) {
        if (value.value != null) {
          return Text(
            'Range : ${controller.answerRange.value}',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return const SizedBox();
        }
      }, controller.answerRange),
      ObxValue((final value) {
        if (value.value != null) {
          return Text(
            'Yes or No : ${controller.answerYesOrNo.value}',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return const SizedBox();
        }
      }, controller.answerYesOrNo),
      ObxValue((final value) {
        if (value.value != null) {
          return Text(
            'Yes or No or NoOne : ${controller.answerYesOrNoOrNoOne.value}',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return const SizedBox();
        }
      }, controller.answerYesOrNoOrNoOne),
      ObxValue((final value) {
        if (value.value != null) {
          final data = base64Decode(controller.answerImage.value!);
          return GestureDetector(
            onTap: () {
              Get.to(() => FullScreenImage(uint8List: data));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              child: Image.memory(data),
            ),
          );
        } else {
          return const SizedBox();
        }
      }, controller.answerImage),
    ].where((element) => element is! SizedBox).toList();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Sl No : ${controller.currentSelectedAnswer?.slNo}'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Checked By : Admin'),
                  // Text('Time Taken : '),
                ],
              ),
            ),
            Icon(
              Icons.download,
              color: Colors.blue,
            ),
            customHorizontalGap(10)
          ],
        ),
        body: GetBuilder<AnsweredProductController>(
            id: Get.find<AnsweredProductController>().answerWidgetID,
            builder: (controller) {
              final data = controller.answerList;
              return SafeArea(
                // child: ListView.separated(
                //   padding: const EdgeInsets.all(10.0),
                //   itemBuilder: (final ctx, final index) => _widgetsList[index],
                //   separatorBuilder: (final ctx, final index) => const SizedBox(height: 10),
                //   itemCount: _widgetsList.length,
                // ),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final answer = data[index].answer;
                      var question = json.decode(data[index].questionEnglish!);

                      List<int> convertedqpenglist = question.cast<int>();
                      var convertedqpeng = utf8.decode(convertedqpenglist);

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: customHeight(95),
                          decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index + 1}  )   ${(convertedqpeng.toString()).toUpperCase()}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                customVerticalGap(10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          answer!.answer != null
                                              ? Text(
                                                  'Answer : ${answer.answer ?? "N/A"}')
                                              : SizedBox(),
                                          answer.dropdown != null
                                              ? Text(
                                                  'Answer : ${answer.dropdown ?? "N/A"}')
                                              : SizedBox(),
                                          answer.range != null
                                              ? Text(
                                                  'Answer : ${answer.range ?? "N/A"}')
                                              : SizedBox(),
                                          answer.yesOrNo != null
                                              ? Text(
                                                  'Answer : ${answer.yesOrNo ?? "N/A"}')
                                              : SizedBox(),
                                          answer.yesOrNoOrNoOne != null
                                              ? Text(
                                                  'Answer : ${answer.yesOrNoOrNoOne ?? "N/A"}')
                                              : SizedBox(),
                                        ],
                                      ),
                                      //customHorizontalGap(100),
                                      answer.image != null
                                          ?
                                          // final data = base64Decode(answer.image!);
                                          GestureDetector(
                                              onTap: () {
                                                Get.to(() => FullScreenImage(
                                                    uint8List: base64Decode(
                                                        answer.image!)));
                                              },
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    child: Image.memory(
                                                        base64Decode(
                                                            answer.image!)),
                                                  ),
                                                  Text(
                                                    'View Image',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: customHeight(5),
                      );
                    },
                    itemCount: data.length),
              );
            }));
  }
}

class FullScreenImage extends StatelessWidget {
  static const routeName = 'FullScreenImage';
  final Uint8List uint8List;

  const FullScreenImage({
    super.key,
    required this.uint8List,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: InteractiveViewer(
        maxScale: 10,
        child: Align(
          alignment: Alignment.center,
          child: Hero(
            tag: 'imageHero',
            child: Image.memory(
              uint8List,
            ),
          ),
        ),
      ),
    );
  }
}
