import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_tech_app/domain/models/answered_product_list/answer_model.dart';

import '../../application/ansswered_product_controller/answered_product_controller.dart';
import '../../domain/responsive/dimensions.dart';
import '../theme/theme.dart';

class Questionsanswer extends StatefulWidget {
  static const routeName = 'Questionsanswer';

  const Questionsanswer({super.key});

  @override
  State<Questionsanswer> createState() => _QuestionsanswerState();
}

class _QuestionsanswerState extends State<Questionsanswer> {
 
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnsweredProductController>(
            id: Get.find<AnsweredProductController>()
                .answeredProductListWidgetID,
            builder: (controller) { 
                final data =controller.answerList;
              
              return Scaffold(
            
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(
            " Product Reivew",
            textAlign: TextAlign.center,
            style: AppTheme.appBarText,
          ),
        ),
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Text('Column A'),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Column B'),
            ),
            DataColumn(
              label: Text('Column C'),
            ),
            DataColumn(
              label: Text('Column D'),
            ),
            DataColumn(
              label: Text('Column NUMBERS'),
              numeric: true,
            ),
             DataColumn(
              label: Text('Column '),
              numeric: true,
            ),
          ],
          rows: List<DataRow>.generate(
              100,
              (index) => DataRow(cells: [
                    DataCell(Text('A' * (10 - index % 10))),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                     DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString()))
                  ]))),
    )
        );});
  }

 
}
