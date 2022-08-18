import 'package:depremapp/interfaces/rest/earthquake/IEarthquakeRestService.dart';
import 'package:depremapp/models/rest/response/earthquake/EarthquakeResponse.dart';
import 'package:depremapp/models/rest/request/earthquake/EarthquakeRequest.dart';

import '../RequestType.dart';
import '../RestServiceManager.dart';

class EarthquakeRestService implements IEarthquakeRestService {
  String? _apiUrl;

  EarthquakeRestService() {
    _apiUrl = "https://api.orhanaydogdu.com.tr/deprem/live.php?";
  }

  @override
  getEarthquake(EarthquakeRequest earthquakeRequest) async {
    EarthquakeResponse earthquakeResponse = EarthquakeResponse.fromJson(await RestServiceManager.call(_apiUrl!, "limit=100", null, RequestType.GET));
    return earthquakeResponse;
  }
}
