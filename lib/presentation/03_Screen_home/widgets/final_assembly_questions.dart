import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../application/assembly_controller/assembly_controller.dart';
import '../../../application/final_assembly_controller/final_assembly_controller.dart';
import '../../../application/home_screen_controller/controller.dart';
import '../../../application/quality_products_controller/quality_product_controller.dart';
import '../../../application/quality_question_edit_controller/quality_question_edit_controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../08_Screen_quality_questions_editor/quality_questions_addingform.dart';
import '../../theme/color.dart';
import '../../widgets/custom_appbar.dart';

class FinalAssemblyQuestionListScreen extends StatelessWidget {
  const FinalAssemblyQuestionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // final product = arguments['product'];
    return GetBuilder<HomeScreenController>(
        id: Get.find<HomeScreenController>().screenHomeWidget,
        builder: (controller) {
          // if (controller.screen == 'DashBoard')
          return Column(
            children: [
              CustomAppBar(context, false, "Final Assembly Questions"),
              customVerticalGap(5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: customWidth(20)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Here',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (data) {
                        Get.find<QualityProductController>()
                            .searchDirectory(data);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                // color: Colors.yellow,
                height: customHeight(580),
                width: customWidth(300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: GetBuilder<FinalAssemblyController>(
                          id: Get.find<FinalAssemblyController>()
                              .finalAssemblyProductID,
                          builder: (controller) {
                            if (controller.assemblyQuestionList.isNotEmpty) {
                              return ListView.separated(
                                  //scrollDirection: Axis.vertical,
                                  //physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      tileColor: Colors.red.shade300,
                                      leading: Text('${index + 1}'),
                                      title: Text(
                                        '${controller.assemblyQuestionList[index].questionEnglish} ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Wrap(
                                        spacing: 12,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Get.find<
                                                        QualityQuestionEditController>()
                                                    .getEditQuestionDetails(
                                                        id: controller
                                                            .assemblyQuestionList[
                                                                index]
                                                            .id
                                                            .toString(),
                                                        screenName:
                                                            'Final Assembly')
                                                    .then((value) {
                                                  Navigator.pushNamed(
                                                      context,
                                                      arguments: {
                                                        'id': controller
                                                            .assemblyQuestionList[
                                                                index]
                                                            .id,
                                                        'screenName':
                                                            'Final Assembly'
                                                      },
                                                      QualityquestionEdit
                                                          .routeName);
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: customWidth(20),
                                                height: customHeight(25),
                                                decoration: BoxDecoration(
                                                  color: LightColor.orange,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: LightColor
                                                          .primaryColor),
                                                ),
                                                child: Text(
                                                  "EDIT",
                                                  style: TextStyle(
                                                      fontSize:
                                                          customFontSize(3),
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text(
                                                        'Are you sure you want to delete'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text('No'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          controller
                                                              .deleteQualityQuestions(
                                                                  id: controller
                                                                      .assemblyQuestionList[
                                                                          index]
                                                                      .id!)
                                                              .then((value) {
                                                            controller.getAssemblyQuestions(
                                                                id: controller
                                                                    .productId);
                                                          });

                                                          Get.back();
                                                        },
                                                        child:
                                                            const Text('Yes'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return customVerticalGap(10);
                                  },
                                  itemCount:
                                      controller.assemblyQuestionList.length);
                            } else {
                              return Text('No Data');
                            }
                          })),
                ),
              )
            ],
          );
        });
  }
}
