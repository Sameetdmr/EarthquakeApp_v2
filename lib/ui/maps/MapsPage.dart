import 'package:depremapp/ui/home/HomePageViewModel.dart';
import 'package:depremapp/ui/maps/MapsPageViewModel.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  MapsPage({Key? key, required this.index}) : super(key: key);
  int index;
  late MapsPageViewModel _mapsPageViewModel;
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _mapsPageViewModel = Get.put(MapsPageViewModel(index, context));
    _homePageViewModel = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _homePageViewModel.eartQuakePM.value.titleList![index],
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            CustomNavigator().popFromMain();
          },
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            markers: _mapsPageViewModel.marker,
            initialCameraPosition: CameraPosition(target: LatLng(_homePageViewModel.eartQuakePM.value.latList![index], _homePageViewModel.eartQuakePM.value.lngList![index]), zoom: 12),
            onMapCreated: (GoogleMapController controller) {
              _mapsPageViewModel.controller.complete(controller);
            },
          ),
        ],
      ),
    );
  }
}
