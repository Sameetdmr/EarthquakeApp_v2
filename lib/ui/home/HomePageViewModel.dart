import 'package:depremapp/models/presentation/EarthquakePM.dart';
import 'package:depremapp/models/rest/request/earthquake/EarthquakeRequest.dart';
import 'package:depremapp/models/rest/response/earthquake/EarthquakeResponse.dart';
import 'package:depremapp/rest/earthquake/EarthquakeRestService.dart';
import 'package:depremapp/ui/ViewModelBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/domain/Result.dart';
import '../../utils/servicelocator/ServiceLocator.dart';

class HomePageViewModel extends ViewModelBase {
  late Rx<EarthquakePM> earthQuakePM = EarthquakePM().obs;
  RxBool isLoading = false.obs;

  IEarthquakeRestService _iEarthquakeRestService = ServiceLocator().get<IEarthquakeRestService>();
  HomePageViewModel() {
    initPage();
    //setCurrentScreen("Home Page");
  }
  void initPage() async {
    try {
      await getEarthQuake();
    } catch (e) {
      exceptionHandlingService.handleException(e);
    }
  }

  Future<void> getEarthQuake({bool isCompare = false}) async {
    isLoading.value = false;
    clearEarthQuakePM();
    EarthquakeRequest earthquakeRequest = new EarthquakeRequest();
    EarthquakeResponse earthquakeResponse = await _iEarthquakeRestService.getEarthquake(earthquakeRequest);

    if (earthquakeResponse.status!) {
      fillEarthQuakePM(earthquakeResponse.result, isCompare: isCompare);
    } else {
      //Hata mesajı
    }
  }

  Future<void> getEarthQuake_ByView({bool isCompare = false}) async {
    try {
      await getEarthQuake(isCompare: isCompare);
    } catch (e) {
      exceptionHandlingService.handleException(e);
    }
  }

  void clearEarthQuakePM() {
    earthQuakePM.value.titleList!.clear();
    earthQuakePM.value.dateTimeList!.clear();
    earthQuakePM.value.magList!.clear();
    earthQuakePM.value.depthList!.clear();
    earthQuakePM.value.latList!.clear();
    earthQuakePM.value.lngList!.clear();
    earthQuakePM.value.colorList!.clear();
  }

  void fillEarthQuakePM(List<Result>? result, {bool isCompare = false}) {
    if (result != null) {
      if (isCompare) {
        result.sort((a, b) => b.mag!.compareTo(a.mag!));
      }
      for (var i = 0; i < result.length; i++) {
        earthQuakePM.value.titleList!.add(result[i].title!);
        earthQuakePM.value.dateTimeList!.add(formatDateTime(result[i].date!));
        earthQuakePM.value.magList!.add(result[i].mag!);
        earthQuakePM.value.depthList!.add(result[i].depth!);
        earthQuakePM.value.latList!.add(result[i].geojson!.coordinates![0]);
        earthQuakePM.value.lngList!.add(result[i].geojson!.coordinates![1]);
      }
      for (var i = 0; i < earthQuakePM.value.magList!.length; i++) {
        if (earthQuakePM.value.magList![i] <= 3) {
          earthQuakePM.value.colorList!.add(Colors.grey.shade400);
        } else if (earthQuakePM.value.magList![i] <= 4) {
          earthQuakePM.value.colorList!.add(Colors.purple);
        } else if (earthQuakePM.value.magList![i] <= 7) {
          earthQuakePM.value.colorList!.add(Colors.green);
        } else if (earthQuakePM.value.magList![i] <= 8) {
          earthQuakePM.value.colorList!.add(Colors.orange);
        } else {
          earthQuakePM.value.colorList!.add(Colors.red);
        }
      }
      isLoading.value = true;
    }
  }

  String formatDateTime(String originalDate) {
    try {
      // Gelen tarih ve saat formatını ayrıştır
      List<String> parts = originalDate.split(' ');
      List<String> dateParts = parts[0].split('.');
      List<String> timeParts = parts[1].split(':');

      // Yeni tarih ve saat formatını oluştur
      String formattedDate = "${timeParts[0]}:${timeParts[1]} - ${dateParts[2]}/${dateParts[1]}/${dateParts[0]} ";

      return formattedDate;
    } catch (e) {
      return originalDate;
    }
  }
}
