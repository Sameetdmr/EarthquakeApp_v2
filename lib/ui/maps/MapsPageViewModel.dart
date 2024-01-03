import 'package:depremapp/ui/ViewModelBase.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapsPageViewModel extends ViewModelBase {
  late List<Marker> markerList = <Marker>[];
  final mapController = MapController();
  final initialZoom = 10.0;
  RxString distanceInKm = ''.obs;

  late final double _latitude;
  late final double _longitude;
  MapsPageViewModel(double latitude, double longitude) {
    this._latitude = latitude;
    this._longitude = longitude;
    initPage();
    setCurrentScreen("Maps Page");
  }
  void initPage() async {
    try {
      await currentLocation();
    } catch (e) {
      exceptionHandlingService.handleException(e);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> currentLocation() async {
    Position currentLocation = await _determinePosition();

    distanceInKm.value = await Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      _latitude,
      _longitude,
    ).toString().substring(0, 3);
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool cameraZoom() {
    final currentZoom = mapController.camera.zoom;
    return mapController.move(mapController.camera.center, currentZoom + 1);
  }

  bool decreaseZoom() {
    final currentZoom = mapController.camera.zoom;
    return mapController.move(mapController.camera.center, currentZoom - 1);
  }
}
