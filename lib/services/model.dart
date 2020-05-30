import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/util.dart';

class WeatherModel {
  AssetImage updateBgPicture(int condition) {
    if (condition < 600) {
      return AssetImage('assets/images/raining.png');
    } else if (condition < 800) {
      return AssetImage('assets/images/cold.png');
    } else if (condition == 800) {
      return AssetImage('assets/images/sunny.png');
    } else {
      return null;
    }
  }

  IconData updateIcon(int condition) {
    if (condition < 600) {
      return Icons.cloud;
    } else if (condition < 800) {
      return Icons.ac_unit;
    } else if (condition == 800) {
      return Icons.wb_sunny;
    } else {
      return null;
    }
  }

  Color updateColor(int condition) {
    if (condition < 600) {
      return UIColors.color1;
    } else if (condition < 800) {
      return UIColors.color2;
    } else if (condition == 800) {
      return UIColors.color3;
    } else {
      return null;
    }
  }
}
