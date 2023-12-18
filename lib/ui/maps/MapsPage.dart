// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:depremapp/ui/maps/components/MapControllerButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:depremapp/ui/maps/MapsPageViewModel.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatelessWidget {
  final String title;
  final double latitude;
  final double longitude;
  final String dateTime;
  final String depth;
  final String mag;
  final Color magColor;
  late MapsPageViewModel _mapsPageViewModel;
  MapsPage({Key? key, required this.title, required this.latitude, required this.longitude, required this.dateTime, required this.depth, required this.mag, required this.magColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _mapsPageViewModel = Get.put(MapsPageViewModel(latitude, longitude));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: context.textTheme.titleSmall?.copyWith(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: _BuildMap(
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
            Expanded(
                flex: 2,
                child: Padding(
                  padding: context.padding.low,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _BuildInfoColumn(
                              icon: Icons.schedule_outlined,
                              label: dateTime,
                            ),
                            _BuildInfoColumn(
                              icon: Icons.location_searching_outlined,
                              label: '${latitude} - ${longitude}',
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => _mapsPageViewModel.distanceInKm.isNotEmpty
                                ? _BuildInfoColumn(
                                    icon: Icons.language_outlined,
                                    label: '${_mapsPageViewModel.distanceInKm.value} km uzakta',
                                  )
                                : CircularProgressIndicator.adaptive(
                                    strokeWidth: 1,
                                  )),
                            _BuildInfoColumn(
                              icon: Icons.apartment,
                              label: '${depth} km derinlik',
                            ),
                          ],
                        ),
                        Text(
                          mag,
                          style: context.textTheme.displaySmall?.copyWith(color: magColor),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _BuildInfoColumn extends StatelessWidget {
  const _BuildInfoColumn({Key? key, required this.icon, required this.label}) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Text(label),
      ],
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
                    color: Colors.purple,
                    size: 40,
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
