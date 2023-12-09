// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:depremapp/models/presentation/EarthquakePM.dart';
import 'package:depremapp/ui/components/CustomAppBar.dart';
import 'package:depremapp/ui/home/HomePageViewModel.dart';
import 'package:depremapp/ui/home/components/EarthquakeCard.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _homePageViewModel = Get.put(HomePageViewModel());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Depremler',
          rightIcon: Icon(Icons.refresh),
          onpressed: () {
            _homePageViewModel.getEarthQuake_ByView();
          },
        ),
        body: Obx(
          () => _homePageViewModel.isLoading.value
              ? _BuildEarthQuakeList(
                  earthQuakePM: _homePageViewModel.earthQuakePM,
                )
              : Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        ),
      ),
    );
  }
}

class _BuildEarthQuakeList extends StatelessWidget {
  final Rx<EarthquakePM> earthQuakePM;
  const _BuildEarthQuakeList({
    Key? key,
    required this.earthQuakePM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return earthQuakePM.value.titleList!.isNotEmpty
        ? ListView.separated(
            itemCount: earthQuakePM.value.titleList!.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              return EarthquakeCard(
                title: earthQuakePM.value.titleList![index],
                date: earthQuakePM.value.dateList![index],
                latitude: earthQuakePM.value.latList![index],
                longitude: earthQuakePM.value.lngList![index],
                mag: earthQuakePM.value.magList![index],
                magColor: earthQuakePM.value.colorList![index],
              );
            },
          )
        : Center(
            child: Text('Deprem Bulunmamaktadır.'),
          );
  }
}
