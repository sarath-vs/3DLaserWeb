import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/domain/models/answered_product_list/answered_product_list_model.dart';

import '../../application/ansswered_product_controller/answered_product_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/theme.dart';
import '../widgets/single_button_alert_dialog.dart';
import 'screen_questions_its_answer.dart';



class ScreenCompletedProducts extends GetView<AnsweredProductController> {
  static const routeName = 'ScreenCompletedProducts';
  
  const ScreenCompletedProducts({super.key});

  @override
  
  StatelessElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  @override
  
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;

      final id = arguments['id'];
   final screenName = arguments['screenName'];
      Get.find<AnsweredProductController>().getAnswerProductLists(id: id,screenName: screenName);
    });
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Completed Product List',
          textAlign: TextAlign.center,
          style: AppTheme.appBarText,
        ),
      ),
      body: Column(
        children: [
           customVerticalGap(10),
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
                        Get.find<AnsweredProductController>()
                            .searchDirectory(data);
                      },
                    ),
                  ),
                ),
              ),
          ObxValue(
            (final items) {
              if (items.value.isEmpty) {
                return const Center(
                  child: Text('No items found'),
                );
              } else {
                return Container(
                  height: 580,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (final ctx, final index) => _ListItem(
                      data: items.value[index],
                      onTap: () {
                        controller.onTapItem(
                          index: index,
                          onSuccess: () {
                            Navigator.pushNamed(
                              Get.context!,
                              Questionsanswer.routeName,
                              arguments: {
                                'id': items.value[index].id,
                              },
                            );
                          },
                          onError: (message) {
                            showSingleButtonAlertDialog(
                              Get.context!,
                              'Warning',
                              message,
                              () {
                                Navigator.of(Get.context!).pop();
                              },
                            );
                          },
                        );
                      },
                    ),
                    separatorBuilder: (final ctx, final index) => const SizedBox(height: 10),
                    itemCount: items.value.length,
                  ),
                );
              }
            },
            controller.productList,
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.data,
    this.onTap,
  });

  final AnsweredListResult data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final map = <String, dynamic>{
      'Sl No': data.slNo,
      'User': data.user,
      'Date Created': data.dateCreated?.split(', ').first,
      'Time Created': data.dateCreated?.split(' ').last,
    };
    final keys = map.keys.toList();
    final values = map.values.toList();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (final ctx, final index) =>
                    _TitleValue(keyName: keys[index], value: values[index].toString()),
                separatorBuilder: (final ctx, final index) => const SizedBox(height: 10),
                itemCount: map.length,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}

class _TitleValue extends StatelessWidget {
  final String keyName;
  final String value;

  const _TitleValue({
    required this.keyName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            keyName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            ':',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
