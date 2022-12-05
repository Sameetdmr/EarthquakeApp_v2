import 'dart:async';

import 'package:depremapp/ui/ViewModelBase.dart';
import 'package:depremapp/ui/home/HomePageViewModel.dart';
import 'package:depremapp/utils/theme/CustomTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';

class MapsPageViewModel extends ViewModelBase {
  late Set<Marker> marker = new Set();
  Completer<GoogleMapController> controller = Completer();
  HomePageViewModel _homePageViewModel = Get.find();
  late int index;
  late BuildContext _context;
  MapsPageViewModel(int index, BuildContext context) {
    this.index = index;
    this._context = context;

    initPage();
    setCurrentScreen("Maps Page");
  }
  initPage() {
    try {
      getMarkers();
    } catch (e) {
      exceptionHandlingService.handleException(e);
    }
  }

  @override
  void onClose() {
    _homePageViewModel.getDeprem();
    super.onClose();
  }

  Future onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final String text = _homePageViewModel.eartQuakePM.value.titleList![index] + ' bölgesinde  ${_homePageViewModel.eartQuakePM.value.magList![index]} şiddetinde deprem olmuştur.';

    Share.share(text, subject: 'Deprem App', sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  getMarkers() {
    try {
      marker.add(Marker(
          markerId: MarkerId(_homePageViewModel.eartQuakePM.value.titleList![index]),
          position: LatLng(_homePageViewModel.eartQuakePM.value.latList![index], _homePageViewModel.eartQuakePM.value.lngList![index]), //position of marker
          infoWindow: InfoWindow(
            title: _homePageViewModel.eartQuakePM.value.titleList![index],
          ),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {
            _buildModalBottomSheet();
          }));
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> _buildModalBottomSheet() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: _context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(_context).size.height / 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_homePageViewModel.eartQuakePM.value.magList![index].toString(), style: CustomTextTheme.instance.boldCardLeadingText.copyWith(color: _homePageViewModel.eartQuakePM.value.colorList![index])),
                      Text(_homePageViewModel.eartQuakePM.value.titleList![index],
                          style: CustomTextTheme.instance.cardTitleText.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(_homePageViewModel.eartQuakePM.value.dateList![index], style: CustomTextTheme.instance.cardTitleText.copyWith(fontWeight: FontWeight.w300)),
                      Text(_homePageViewModel.eartQuakePM.value.depthList![index].toString(), style: CustomTextTheme.instance.cardTitleText.copyWith(fontWeight: FontWeight.w300))
                    ],
                  ),
                  Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      onShare(_context);
                    },
                  ))
                ],
              ),
            ),
          );
        });
  }
}
