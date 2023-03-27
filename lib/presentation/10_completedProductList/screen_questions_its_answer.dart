import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/ansswered_product_controller/answered_product_controller.dart';
import 'package:laser_tech_app/domain/extensions/int.dart';

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
    });

    final _widgetsList = [
      Column(
        mainAxisSize: MainAxisSize.min,
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
          ObxValue(
            (final time) => Text(
              '⏳ ${time.value.toMinAndSec()} Sec',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller.timeTakenToComplete,
          ),
        ],
      ),
      Text(
        'Answers',
        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
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
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              child: Image.memory(data),
            ),
          );
        } else {
          return const SizedBox();
        }
      }, controller.answerImage),
    ].where((element) => element is! SizedBox).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sl No : ${controller.currentSelectedAnswer?.slNo}'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (final ctx, final index) => _widgetsList[index],
          separatorBuilder: (final ctx, final index) => const SizedBox(height: 10),
          itemCount: _widgetsList.length,
        ),
      ),
    );
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
