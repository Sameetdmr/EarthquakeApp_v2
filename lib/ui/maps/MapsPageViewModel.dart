import 'package:depremapp/ui/ViewModelBase.dart';
import 'package:flutter_map/flutter_map.dart';

class MapsPageViewModel extends ViewModelBase {
  late List<Marker> markerList = <Marker>[];
  final mapController = MapController();
  final initialZoom = 10.0;
  MapsPageViewModel() {
    initPage();
    //setCurrentScreen("Maps Page");
  }
  void initPage() {
    try {} catch (e) {
      exceptionHandlingService.handleException(e);
    }
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
