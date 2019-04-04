import 'package:flutter/material.dart';

class ColorConstant {
  static const Color primaryColor = Color(0xFF5b74FF);
  static const Color btnDisabledColor = Color(0xFFDCDCDC);

  static const Color defaultPageBackgroundColor = Color(0xFFF7F7F7);

  static const Color defaultLineColor = Color(0xFFF0F0F0);
  static const Color activeLineColor = Color(0xFFA5C8FB);
  static const Color selectedWidgetColor = Color(0xFF4FCBFF);
  static const Color hintColor = Color(0xFFCDC1C1);
  static const Color editTextColor = Color(0x99223344);
  static getUnderLine(Color color,
      {double width = 0.5, BorderStyle style = BorderStyle.solid}) {
    return UnderlineInputBorder(
        borderSide: BorderSide(
      color: color,
      width: width,
      style: style,
    ));
  }

  static getOutLine(Color color,
      {double width = 0.5,
      BorderStyle style = BorderStyle.solid,
      double radius = 8}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: width,
          style: style,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
