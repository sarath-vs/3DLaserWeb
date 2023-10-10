import 'package:flutter/material.dart';
import 'package:laser_tech_app/domain/responsive/dimensions.dart';
import 'package:laser_tech_app/presentation/theme/theme.dart';

class Dropdownoption extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController engController = TextEditingController();
  final TextEditingController czechController = TextEditingController();
  final TextEditingController vitenmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'English',
            style: AppTheme.h9Style,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            controller: engController,
            minLines: 1,
            maxLines: 7,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'english option is required';
              }
              return null;
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Add Drop Down Values in English.",
              hintStyle: TextStyle(fontSize: customFontSize(4)),
              fillColor: Colors.grey.shade200,
              filled: true,
              floatingLabelStyle: AppTheme.h2Style,
            ),
          ),
          Text(
            'Czech',
            style: AppTheme.h9Style,
          ),
          TextFormField(
            controller: czechController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 7,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'czech is required';
              }
              return null;
            },
            onChanged: (value) {
              // dropDownDataCzech = value;
            },
            decoration: InputDecoration(
              hintText: "Add Drop Down Values in Czech.",
              hintStyle: TextStyle(fontSize: customFontSize(4)),
              fillColor: Colors.grey.shade200,
              filled: true,
              floatingLabelStyle: AppTheme.h2Style,
            ),
          ),
          Text(
            'Vietnam',
            style: AppTheme.h9Style,
          ),
          TextFormField(
            controller: vitenmController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 7,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'vietnm is required';
              }
              return null;
            },
            onChanged: (value) {
              // dropDownDataViatnam = value;
            },
            decoration: InputDecoration(
              hintText: "Add Drop Down Values in Vietnam.",
              hintStyle: TextStyle(fontSize: customFontSize(4)),
              fillColor: Colors.grey.shade200,
              filled: true,
              floatingLabelStyle: AppTheme.h2Style,
            ),
          ),
        ],
      ),
    );
  }
}
