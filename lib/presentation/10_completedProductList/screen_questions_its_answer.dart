import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../domain/responsive/dimensions.dart';
import '../theme/theme.dart';

class Questionsanswer extends StatefulWidget {
  static const routeName = 'Questionsanswer';

  const Questionsanswer({super.key});

  @override
  State<Questionsanswer> createState() => _QuestionsanswerState();
}

class _QuestionsanswerState extends State<Questionsanswer> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  ];
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(
            " Question's & Its Answers",
            textAlign: TextAlign.center,
            style: AppTheme.appBarText,
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: customHeight(900),
              width: customWidth(300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: customHeight(300),
                      width: customHeight(300),
                      child: PageView.builder(
                          itemCount: imgList.length,
                          pageSnapping: true,
                          controller: PageController(
                              viewportFraction: 1, initialPage: 1),
                          onPageChanged: (page) {
                            setState(() {
                              activePage = page;
                            });
                          },
                          itemBuilder: (context, pagePosition) {
                            return Container(
                              margin: EdgeInsets.all(3),
                              child: Image.network(
                                imgList[pagePosition],
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                    customVerticalGap(20),
                    questionanswer("1.sample question ", "sample answers"),
                    customVerticalGap(20),
                    questionanswer("2.sample question ", "sample answers"),
                    customVerticalGap(20),
                    questionanswer("4.sample question ", "sample answers"),
                    customVerticalGap(20),
                    questionanswer("5.sample question ", "sample answers"),
                    customVerticalGap(20),
                    questionanswer("6.sample question ", "sample answers"),
                    customVerticalGap(20),
                    questionanswer("7.sample question ", "sample answers"),
                    customVerticalGap(20),
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  Widget questionanswer(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
              fontSize: customFontSize(4), fontWeight: FontWeight.bold),
        ),
        customVerticalGap(5),
        Row(
          children: [
            Text(
              'Ans: ',
              style: TextStyle(
                  fontSize: customFontSize(4), fontWeight: FontWeight.bold),
            ),
            Text(
              answer,
              style: AppTheme.h3Style,
            ),
          ],
        ),
      ],
    );
  }
}
