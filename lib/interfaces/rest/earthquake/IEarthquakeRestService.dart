import 'package:depremapp/models/rest/request/earthquake/EarthquakeRequest.dart';
import 'package:depremapp/models/rest/response/earthquake/EarthquakeResponse.dart';

abstract class IEarthquakeRestService {
  Future<EarthquakeResponse?> getEarthquake(EarthquakeRequest earthquakeRequest);
}
