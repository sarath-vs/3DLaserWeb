import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:laser_tech_app/domain/responsive/dimensions.dart';
import 'package:laser_tech_app/presentation/theme/color.dart';

import '../../main.dart';
import '../theme/theme.dart';

class CommonUI {
  static Widget dropdown({
    required String title,
    required String initialValue,
    required List items,
    bool isMandatory = true,
    required var currentValue,
    required Function(dynamic) onchanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: title + ':',
                  style: TextStyle(
                      fontSize: customFontSize(5), fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: ' '),
                    isMandatory
                        ? TextSpan(
                            text: ' *',
                            style: TextStyle(
                              fontSize: customFontSize(5),
                              color: Color.fromARGB(255, 222, 4, 4),
                              fontWeight: FontWeight.bold,
                            ))
                        : const TextSpan(text: ' '),
                    // can add more TextSpans here...
                  ],
                ),
              ),
              customHorizontalGap(6),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      value: 'Android',
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Android',
                        'IOS',
                        'Flutter',
                        'Node',
                        'Java',
                        'Python',
                        'PHP',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: customFontSize(5)),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Please choose a langauage",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onChanged: (value) {},
                      // onChanged: (String value) {
                      //   // setState(() {
                      //   //   _chosenValue = value;
                      //   // });
                      // };,
                    ))),
              )
            ],
          ),
        ],
      ),
    );
  }

  static Widget staticTextField(
    String title, {
    String value = '',
    String hintText = "",
    bool isMandatory = true,
    bool NumberOnly = false,
    TextInputType type = TextInputType.name,
  }) {
    TextEditingController ctrl = TextEditingController();
    ctrl.text = value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: customWidth(40),
            child: Text(
              title + ' :',
              style: TextStyle(
                  fontSize: customFontSize(5), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: customWidth(150),
            child: TextFormField(
              validator: (val) {
                return null;
              },
              onChanged: (value) {
                // password = value;
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: Colors.grey.shade200,
                filled: true,
                floatingLabelStyle: AppTheme.h2Style,
                labelText: value,
                labelStyle: AppTheme.h2Style,
                hintText: hintText,
                hintStyle: AppTheme.h2Style,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget questionTile(
    String count,
    String question,
    String buttonTitle1,
    String buttonTitle2, {
    bool isMandatory = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffe8daef),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$count) $question ?',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: AppTheme.h4Style,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: navigatorKey.currentContext!,
                          builder: (_) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                content: Builder(
                                  builder: (context) {
                                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                    var height =
                                        MediaQuery.of(context).size.height;
                                    var width =
                                        MediaQuery.of(context).size.width;

                                    return SizedBox(
                                        height: height - 300,
                                        width: width - 400,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // shrinkWrap: true,
                                          children: [
                                            customVerticalGap(20),
                                            Text(
                                              'Description',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: customFontSize(5)),
                                            ),
                                            customVerticalGap(30),
                                            Container(
                                              child: Text(
                                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                              ),
                                            ),
                                            customVerticalGap(20),
                                            Container(
                                              height: customHeight(330),
                                              child: ListView.separated(
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      ((context, index) {
                                                    return Container(
                                                        height: customHeight(
                                                          100,
                                                        ),
                                                        color: Colors
                                                            .grey.shade200,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      'Step 1 (step name )',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              customFontSize(5))),
                                                                  SizedBox(
                                                                    width:
                                                                        customWidth(
                                                                            200),
                                                                    child: Text(
                                                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley '),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    customHeight(
                                                                        105),
                                                                child: Image.asset(
                                                                    'assets/icons/final_check.jpg'),
                                                              )
                                                            ],
                                                          ),
                                                        ));
                                                  }),
                                                  separatorBuilder:
                                                      ((context, index) {
                                                    return customVerticalGap(4);
                                                  }),
                                                  itemCount: 10),
                                            )
                                          ],
                                        ));
                                  },
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.red.shade800),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Close',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        customFontSize(6)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Color.fromARGB(255, 111, 243, 111),
                            ),
                            customHorizontalGap(2),
                            Text(
                              'Info',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: customFontSize(4),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: -1,
                        onChanged: (value) {},
                        activeColor: LightColor.primaryColor),
                    Text(
                      buttonTitle1,
                      style: AppTheme.h4Style,
                    ),
                    customHorizontalGap(20),
                    Radio(
                        value: 2,
                        groupValue: 1,
                        onChanged: (value) {},
                        activeColor: LightColor.primaryColor),
                    Text(
                      buttonTitle2,
                      style: AppTheme.h4Style,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
