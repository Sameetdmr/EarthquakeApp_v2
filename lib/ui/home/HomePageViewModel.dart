import 'package:depremapp/interfaces/rest/earthquake/IEarthquakeRestService.dart';
import 'package:depremapp/models/presentation/EarthquakePM.dart';
import 'package:depremapp/models/rest/request/earthquake/EarthquakeRequest.dart';
import 'package:depremapp/ui/ViewModelBase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/domain/Result.dart';
import '../../utils/servicelocator/ServiceLocator.dart';

class HomePageViewModel extends ViewModelBase {
  late Rx<EarthquakePM> eartQuakePM = EarthquakePM().obs;
  RxBool isLoading = false.obs;

  IEarthquakeRestService _iEarthquakeRestService = ServiceLocator().get<IEarthquakeRestService>();
  HomePageViewModel() {
    initPage();
  }
  initPage() {
    getDeprem();
  }

  getDeprem() async {
    isLoading.value = false;
    try {
      EarthquakeRequest earthquakeRequest = new EarthquakeRequest();
      earthquakeRequest.limit = 100;

      final earthquakeResponse = await _iEarthquakeRestService.getEarthquake(earthquakeRequest);

      if (earthquakeResponse!.status == true) {
        fillDepremPM(earthquakeResponse.result);
      } else {
        //Hata mesajı
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  fillDepremPM(List<Result>? result) {
    if (result != null) {
      for (var i = 0; i < result.length; i++) {
        eartQuakePM.value.titleList!.add(result[i].title!);
        eartQuakePM.value.dateList!.add(result[i].date!);
        eartQuakePM.value.magList!.add(result[i].mag!);
        eartQuakePM.value.depthList!.add(result[i].depth!);
        eartQuakePM.value.latList!.add(result[i].lat!);
        eartQuakePM.value.lngList!.add(result[i].lng!);
      }
      for (var i = 0; i < eartQuakePM.value.magList!.length; i++) {
        if (eartQuakePM.value.magList![i] <= 3) {
          eartQuakePM.value.colorList!.add(Colors.grey.shade400);
        } else if (eartQuakePM.value.magList![i] <= 4) {
          eartQuakePM.value.colorList!.add(Colors.purple);
        } else if (eartQuakePM.value.magList![i] <= 7) {
          eartQuakePM.value.colorList!.add(Colors.green);
        } else if (eartQuakePM.value.magList![i] <= 8) {
          eartQuakePM.value.colorList!.add(Colors.orange);
        } else {
          eartQuakePM.value.colorList!.add(Colors.red);
        }
      }

      isLoading.value = true;
    }
  }
}
