// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:depremapp/ui/components/CustomAppBar.dart';
import 'package:depremapp/ui/maps/MapsPageViewModel.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatelessWidget {
  final String title;
  final double latitude;
  final double longitude;
  late MapsPageViewModel _mapsPageViewModel;
  MapsPage({
    Key? key,
    required this.title,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _mapsPageViewModel = Get.put(MapsPageViewModel());
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            CustomNavigator().popFromMain();
          },
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapsPageViewModel.mapController,
            options: MapOptions(
              initialZoom: 10,
              initialCenter: latLng.LatLng(latitude, longitude),
            ),
            children: [
              TileLayer(
                urlTemplate: 'http://mt{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                subdomains: const ['0', '1', '2', '3'],
              ),
              MarkerLayer(markers: [
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(latitude, longitude),
                  child: Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    final currentZoom = _mapsPageViewModel.mapController.camera.zoom;
                    _mapsPageViewModel.mapController.move(_mapsPageViewModel.mapController.camera.center, currentZoom + 1);
                  },
                  icon: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    final currentZoom = _mapsPageViewModel.mapController.camera.zoom;
                    _mapsPageViewModel.mapController.move(_mapsPageViewModel.mapController.camera.center, currentZoom - 1);
                  },
                  icon: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
