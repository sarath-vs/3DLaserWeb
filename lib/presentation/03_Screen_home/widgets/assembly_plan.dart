import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/application/quality_products_controller/quality_product_controller.dart';
import 'package:laser_tech_app/presentation/11_screen_assembly_add/assembly_edit.dart';
import '../../../application/assembly_controller/assembly_controller.dart';
import '../../../application/home_screen_controller/controller.dart';
import '../../../domain/responsive/dimensions.dart';
import '../../09_Screen_quality_control_properties_edit/quality_control_properties_addingform.dart';
import '../../10_completedProductList/screen_completed_product_list.dart';
import '../../theme/color.dart';
import '../../widgets/custom_appbar.dart';

class AssemblyPlanScreen extends StatelessWidget {
  const AssemblyPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        id: Get.find<HomeScreenController>().screenHomeWidget,
        builder: (controller) {
          WidgetsBinding.instance.addPostFrameCallback((duration) {
            Get.find<AssemblyProductController>().getAssemblyProducts();
          });
          // if (controller.screen == 'DashBoard')
          return Column(
            children: [
              CustomAppBar(context, false, controller.screen),
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
                        Get.find<AssemblyProductController>()
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
                      child: GetBuilder<AssemblyProductController>(
                          id: Get.find<AssemblyProductController>()
                              .assemblyProductID,
                          builder: (controller) {
                            if (controller.assemblyProductList.isNotEmpty) {
                              return ListView.separated(
                                  //scrollDirection: Axis.vertical,
                                  //physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                     onTap: () {
                                       Get.find<AssemblyProductController>()
                                            .getAssemblyQuestions(id: controller
                                                    .assemblyProductList[index]
                                                    .id!);
                                     
                                        Get.find<AssemblyProductController>()
                                                .productId =
                                            controller
                                                .assemblyProductList[index].id!;

                                        Get.find<HomeScreenController>().appBarName(
                                            '${controller.assemblyProductList[index].name}   ');
                                        Get.find<HomeScreenController>()
                                            .setHomeScreen('ASSEMBLY QUESTION');
                                      },
                                      tileColor: Colors.blue.shade100,
                                      leading: Text('${index + 1}'),
                                      title: Row(
                                        children: [
                                          Text(
                                            '${controller.assemblyProductList[index].name} ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(
                                          //   '(${index + 5} Questions)',
                                          //   style: TextStyle(
                                          //       color: Colors.grey[600]),
                                          // )
                                        ],
                                      ),
                                      trailing: Wrap(
                                        spacing: 12,
                                        children: [
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     Navigator.pushNamed(
                                          //       Get.context!,
                                          //       ScreenCompletedProducts
                                          //           .routeName,
                                          //       arguments: {
                                          //         'id': controller
                                          //             .assemblyProductList[index]
                                          //             .id!,
                                          //         'productName': controller
                                          //       },
                                          //     );
                                          //   },
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     child: Container(
                                          //       alignment: Alignment.center,
                                          //       width: customWidth(40),
                                          //       height: customHeight(25),
                                          //       decoration: BoxDecoration(
                                          //         color: Colors.black,
                                          //         borderRadius:
                                          //             BorderRadius.all(
                                          //                 Radius.circular(5)),
                                          //         border: Border.all(
                                          //             width: 1,
                                          //             color: LightColor
                                          //                 .primaryColor),
                                          //       ),
                                          //       child: Text(
                                          //         "Completed Works",
                                          //         style: TextStyle(
                                          //             fontSize:
                                          //                 customFontSize(4),
                                          //             color: Colors.white),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  Get.context!,
                                                  AssemblyProductEditor
                                                      .routeName,
                                                  arguments: {
                                                    'id': controller
                                                        .assemblyProductList[
                                                            index]
                                                        .id!,
                                                    'productName': controller
                                                        .assemblyProductList[
                                                            index]
                                                        .name!,
                                                    'description': controller
                                                        .assemblyProductList[
                                                            index]
                                                        .description!,
                                                    'time_limit': controller
                                                        .assemblyProductList[
                                                            index]
                                                        .time_limit!,
                                                         'genQR': controller
                                                        .assemblyProductList[
                                                            index]
                                                        .qrRequired!,
                                                         'finalAssembly': controller
                                                        .assemblyProductList[
                                                            index]
                                                        .isFinal!,

                                                        

                                                        

                                                           'ipAddress':controller
                                                        .assemblyProductList[
                                                            index].ipAddress,
      'portNumber':controller
                                                        .assemblyProductList[
                                                            index].port,
   'printerData':controller
                                                        .assemblyProductList[
                                                            index].productObj!.zebraData??"N/A",

                                                            
                                                  },

                                                    
                                                );
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
                                              int id = controller
                                                  .assemblyProductList[index]
                                                  .id!;
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
                                                              .deleteAssemblyProduct(
                                                                  id: id)
                                                              .then((value) =>
                                                                  controller
                                                                      .getAssemblyProducts());
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
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: customHeight(25),
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
                                      controller.assemblyProductList.length);
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
