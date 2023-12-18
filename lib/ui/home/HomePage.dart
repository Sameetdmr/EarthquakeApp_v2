// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:depremapp/ui/components/CustomLottie.dart';
import 'package:depremapp/utils/constants/App_Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:depremapp/models/presentation/EarthquakePM.dart';
import 'package:depremapp/ui/home/HomePageViewModel.dart';
import 'package:depremapp/ui/home/components/EarthquakeCard.dart';
import 'package:kartal/kartal.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _homePageViewModel = Get.put(HomePageViewModel());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            await _homePageViewModel.getEarthQuake_ByView();
          },
          child: Padding(
            padding: context.padding.low,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomLottie(
                        lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING,
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            _homePageViewModel.getEarthQuake_ByView(isCompare: true);
                          },
                          icon: Icon(
                            Icons.sort,
                            size: 30.h,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Obx(
                    () => _homePageViewModel.isLoading.value
                        ? _BuildEarthQuakeList(
                            earthQuakePM: _homePageViewModel.earthQuakePM,
                          )
                        : Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                  ),
                ),
              ],
            ),
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
                dateTime: earthQuakePM.value.dateTimeList![index],
                latitude: earthQuakePM.value.latList![index],
                longitude: earthQuakePM.value.lngList![index],
                mag: earthQuakePM.value.magList![index].toString(),
                magColor: earthQuakePM.value.colorList![index],
                depth: earthQuakePM.value.depthList![index].toString(),
              );
            },
          )
        : Center(
            child: Text('Deprem Bulunmamaktadır.'),
          );
  }
}
