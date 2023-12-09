import 'package:depremapp/ui/ViewModelBase.dart';
import 'package:flutter_map/flutter_map.dart';

class MapsPageViewModel extends ViewModelBase {
  late List<Marker> markerList = <Marker>[];
  final mapController = MapController();
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
}
