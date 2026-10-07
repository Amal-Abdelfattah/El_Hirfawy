import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

extension StringExtensions on String {
  String get capitalize {
    if (isEmpty) return this;

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool get isValidEmail {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(this);
  }
}
