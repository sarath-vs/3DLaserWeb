import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/responsive/dimensions.dart';
import '../04_Screen_quality_control_properties/widget/image_uploading_widget.dart';
import '../theme/color.dart';
import '../theme/theme.dart';

class Qualityquestionform extends StatefulWidget {
  static const routeName = 'Qualityquestionform';
  const Qualityquestionform({super.key});

  @override
  State<Qualityquestionform> createState() => _QualityquestionformState();
}

class _QualityquestionformState extends State<Qualityquestionform> {
  bool isDefault = false;
  bool isnone = false;
  bool isimagedefined = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add/Edit Questions",
          textAlign: TextAlign.center,
          style: AppTheme.appBarText,
        ),
      ),
      // drawer: SideMenu(),
      body: SafeArea(
          child: ListView(
        children: [
          // CustomAppBar(context, false, controller.screen),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
            child: Container(
              height: customHeight(530),
              width: customWidth(250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question Details",
                      style: AppTheme.h8Style,
                    ),
                    // customVerticalGap(20),
                    Text(
                      "Question*",
                      style: AppTheme.h6Style,
                    ),
                    SizedBox(
                      width: customWidth(400),
                      child: TextFormField(
                        validator: (val) {
                          return null;
                        },
                        onChanged: (value) {
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Questions*",

                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sort",
                              style: AppTheme.h6Style,
                            ),
                            SizedBox(
                              width: customWidth(25),
                              child: TextFormField(
                                validator: (val) {
                                  return null;
                                },
                                onChanged: (value) {
                                  // password = value;
                                },
                                decoration: InputDecoration(
                                  hintText: "Sort",
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(20)),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  floatingLabelStyle: AppTheme.h2Style,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Answer type *",
                                  style: AppTheme.h6Style,
                                ),
                                answertypeoption()
                              ],
                            ),
                            Text(
                              "Tools Requied  *",
                              style: AppTheme.h6Style,
                            ),
                            SizedBox(
                              width: customWidth(75),
                              child: MultiSelectDropdown(
                                  hintText: "tools requied",
                                  items: [
                                    "screw driver",
                                    "hammer",
                                    "l key bolt",
                                  ],
                                  onSelectionChanged: onSelectionChanged),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Discripiton field",
                                        style: AppTheme.h6Style,
                                      ),
                                      Checkbox(
                                        value: isDefault,
                                        checkColor:
                                            Colors.white, // color of tick Mark
                                        activeColor: LightColor.primaryColor,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isDefault = !isDefault;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "image uploading field",
                                        style: AppTheme.h6Style,
                                      ),
                                      Checkbox(
                                        value: isimagedefined,
                                        checkColor:
                                            Colors.white, // color of tick Mark
                                        activeColor: LightColor.primaryColor,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isimagedefined = !isimagedefined;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // Numerictype(),
                    // predefinedtype(),
                    yesornotype(),

                    Text(
                      "Question Discripiton",
                      style: AppTheme.h6Style,
                    ),
                    SizedBox(
                      // width: customWidth(150),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 7,
                        validator: (val) {
                          return null;
                        },
                        onChanged: (value) {
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Question Discripiton",
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          floatingLabelStyle: AppTheme.h2Style,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                          width: customWidth(150),
                          child: const ImageUploadEidget()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: customWidth(50),
                            height: customHeight(40),
                            decoration: BoxDecoration(
                              color: LightColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(
                                  width: 1, color: LightColor.primaryColor),
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: customFontSize(5),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: customWidth(50),
                            height: customHeight(40),
                            decoration: BoxDecoration(
                              // color: LightColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              border: Border.all(
                                  width: 1, color: LightColor.primaryColor),
                            ),
                            child: Text(
                              "Cancel",
                              style: AppTheme.h3Style,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  bool numericvalue = false;
  bool predefinedvalue = false;
  bool yesornovalue = false;
  String answertype = "";
  _onChangednumeric(value) {
    setState(() {
      numericvalue = value;
      answertype = "NUMERIC";
      if (numericvalue == true) {
        predefinedvalue = !value;
        yesornovalue = !value;
      }
    });
  }

  _onChangedpredifined(value) {
    setState(() {
      predefinedvalue = value;
      answertype = "gpay";
      if (predefinedvalue == true) {
        numericvalue = !value;
        yesornovalue = !value;
      }
    });
  }

  _onChangedyesorno(value) {
    setState(() {
      yesornovalue = value;
      answertype = "YES or NO";
      if (yesornovalue == true) {
        numericvalue = !value;
        predefinedvalue = !value;
      }
    });
  }

  Widget answertypeoption() {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "NUMERIC",
              style: AppTheme.h6Style,
            ),
            Switch(
                activeColor: LightColor.primaryColor,
                value: numericvalue,
                onChanged: (bool numericvalue) {
                  _onChangednumeric(numericvalue);
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Predifiened",
              style: AppTheme.h6Style,
            ),
            Switch(
                activeColor: LightColor.primaryColor,
                value: predefinedvalue,
                onChanged: (bool predefinedvalue) {
                  _onChangedpredifined(predefinedvalue);
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "YES or NO",
              style: AppTheme.h6Style,
            ),
            Switch(
                activeColor: LightColor.primaryColor,
                value: yesornovalue,
                onChanged: (bool yesornovalue) {
                  _onChangedyesorno(yesornovalue);
                })
          ],
        ),
      ],
    ));
  }

  String dropdownvalue = 'yes';
  var yesornoanswer = ['yes', 'no'];

  Widget yesornotype() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Answer",
              style: AppTheme.h6Style,
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey.shade200,
                  // borderRadius: BorderRadius.circular(20)
                ),
                width: customWidth(75),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    underline: SizedBox(),
                    hint: Text(
                      'Select  yes or no',
                      style: TextStyle(fontSize: customFontSize(6)),
                    ),
                    value: dropdownvalue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: yesornoanswer.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "None field",
            style: AppTheme.h6Style,
          ),
        ),
        Checkbox(
          value: isnone,
          checkColor: Colors.white, // color of tick Mark
          activeColor: LightColor.primaryColor,
          onChanged: (bool? value) {
            setState(() {
              isnone = !isnone;
            });
          },
        ),
      ],
    );
  }

  Widget predefinedtype() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Answer",
          style: AppTheme.h6Style,
        ),
        Row(
          children: [
            Text(
              "1.",
              style: AppTheme.h6Style,
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
                  hintText: "answer",
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  floatingLabelStyle: AppTheme.h2Style,
                ),
              ),
            ),
            InkWell(
              child: const Icon(Icons.delete_outline_sharp),
              onTap: () {},
            )
          ],
        ),
        Row(
          children: [
            Text(
              "add next answer",
              style: AppTheme.h6Style,
            ),
            Container(
                alignment: Alignment.center,
                color: LightColor.primaryColor,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.add)))
          ],
        ),
      ],
    );
  }

  Widget Numerictype() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              "Answer",
              style: AppTheme.h6Style,
            ),
            SizedBox(
              width: customWidth(25),
              child: TextFormField(
                validator: (val) {
                  return null;
                },
                onChanged: (value) {
                  // password = value;
                },
                decoration: InputDecoration(
                  hintText: "answer",
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  floatingLabelStyle: AppTheme.h2Style,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            children: [
              Text(
                "Range start from to end ",
                style: AppTheme.h6Style,
              ),
              Row(
                children: [
                  SizedBox(
                    width: customWidth(15),
                    child: TextFormField(
                      validator: (val) {
                        return null;
                      },
                      onChanged: (value) {
                        // password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "starting range",
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        floatingLabelStyle: AppTheme.h2Style,
                      ),
                    ),
                  ),
                  Text(
                    "TO ",
                    style: AppTheme.h6Style,
                  ),
                  SizedBox(
                    width: customWidth(15),
                    child: TextFormField(
                      validator: (val) {
                        return null;
                      },
                      onChanged: (value) {
                        // password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "ending range",
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        floatingLabelStyle: AppTheme.h2Style,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onSelectionChanged(Set<String> selectedItems) {
    print('Selected items: $selectedItems');
  }
}

class MultiSelectDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(Set<String>) onSelectionChanged;

  MultiSelectDropdown({
    required this.items,
    required this.hintText,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  Set<String> _selectedValues = Set();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isDense: true,
      isExpanded: true,
      value: _selectedValues.isNotEmpty ? _selectedValues.toList()[0] : null,
      hint: Text(widget.hintText),
      onChanged: (newValue) {
        setState(() {
          if (_selectedValues.contains(newValue!)) {
            _selectedValues.remove(newValue);
          } else {
            _selectedValues.add(newValue);
          }
          widget.onSelectionChanged(_selectedValues);
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Checkbox(
                value: _selectedValues.contains(value),
                onChanged: (_) {
                  setState(() {
                    if (_selectedValues.contains(value)) {
                      _selectedValues.remove(value);
                    } else {
                      _selectedValues.add(value);
                    }
                    widget.onSelectionChanged(_selectedValues);
                  });
                },
              ),
              SizedBox(width: 10),
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  }
}
