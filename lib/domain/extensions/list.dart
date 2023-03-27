import 'package:flutter/material.dart';

extension WidgetExtension on Iterable<Widget> {
  /// Add seperator between column/row childrens
  Iterable<Widget> seperator({required final Widget element}) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}
