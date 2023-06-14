import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final int value;

  const Provider({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  static Provider? of(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<Provider>()
      : context.getElementForInheritedWidgetOfExactType<Provider>()?.widget as Provider?;

  @override
  bool updateShouldNotify(Provider oldWidget) => value != oldWidget.value;
}
