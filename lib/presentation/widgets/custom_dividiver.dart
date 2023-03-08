// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../domain/responsive/dimensions.dart';

class CustomDivider extends StatelessWidget {
  final double opacity;

  const CustomDivider({this.opacity = 1.0});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(
          height: customHeight(1),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[400]),
        ),
      ),
    );
  }
}
