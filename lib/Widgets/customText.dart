import 'package:flutter/material.dart';

const headingStyle =
TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
Widget customText({
  String? text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? txtDecoration,
  TextOverflow? overFlow,
}) {
  return Text(
    text!,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: txtDecoration,
        overflow: overFlow ?? TextOverflow.ellipsis),
  );
}