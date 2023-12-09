// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:depremapp/ui/maps/components/MapControllerButton.dart';
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
    return SafeArea(
      child: Scaffold(
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
        body: _BuildMap(
            mapController: _mapsPageViewModel.mapController,
            zoomOnPressed: () {
              _mapsPageViewModel.cameraZoom();
            },
            decreaseOnPressed: () {
              _mapsPageViewModel.decreaseZoom();
            },
            initialZoom: _mapsPageViewModel.initialZoom,
            latitude: latitude,
            longitude: longitude),
      ),
    );
  }
}

class _BuildMap extends StatelessWidget {
  _BuildMap({
    required this.mapController,
    required this.zoomOnPressed,
    required this.decreaseOnPressed,
    required this.initialZoom,
    required this.latitude,
    required this.longitude,
  });

  final MapController mapController;
  final void Function() zoomOnPressed;
  final void Function() decreaseOnPressed;
  final double initialZoom;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialZoom: initialZoom,
            initialCenter: latLng.LatLng(latitude, longitude),
          ),
          children: [
            TileLayer(
              urlTemplate: 'http://mt{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
              subdomains: const ['0', '1', '2', '3'],
            ),
            MarkerLayer(markers: [
              Marker(
                point: LatLng(latitude, longitude),
                child: Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
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
              MapControllerButton(onPressed: zoomOnPressed, buttonType: ButtonType.Zoom),
              const SizedBox(width: 10),
              MapControllerButton(onPressed: decreaseOnPressed, buttonType: ButtonType.Decrease),
            ],
          ),
        ),
      ],
    );
  }
}
