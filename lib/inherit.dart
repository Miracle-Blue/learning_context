import 'package:flutter/material.dart';

class DataProviderInherit extends InheritedWidget {
  final int value;

  const DataProviderInherit({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataProviderInherit oldWidget) => value != oldWidget.value;
}
