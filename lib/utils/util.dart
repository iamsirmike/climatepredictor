import 'package:flutter/material.dart';

class UIColors {
  static const Color color1 = Color(0xff16E5FF);
  static const Color color2 = Color(0xffF870E1);
  static const Color color3 = Color(0xffFF8363);
}

double screenHeight(BuildContext context, double percent) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, double percent) =>
    MediaQuery.of(context).size.width * percent;