import 'package:flutter/material.dart';

class EarthquakePM {
  List<String>? titleList;
  List<String>? dateList;
  List<double>? magList;
  List<double>? depthList;
  List<double>? lngList;
  List<double>? latList;
  List<Color>? colorList;

  EarthquakePM() {
    titleList = <String>[];
    dateList = <String>[];
    magList = <double>[];
    depthList = <double>[];
    lngList = <double>[];
    latList = <double>[];

    colorList = <Color>[];
  }
}
