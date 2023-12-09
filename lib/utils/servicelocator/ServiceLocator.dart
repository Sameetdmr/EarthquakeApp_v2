import 'package:depremapp/rest/earthquake/EarthquakeRestService.dart';
import 'package:get/get.dart';
import '../../services/common/ExceptionHandlingService.dart';

class ServiceLocator {
  static final ServiceLocator _singleton = ServiceLocator._internal();

  ServiceLocator._internal();

  factory ServiceLocator() {
    return _singleton;
  }

  T get<T>() {
    return Get.find<T>();
  }

  void init() {
    Get.lazyPut<IExceptionHandlingService>(() => ExceptionHandlingService(), fenix: true);
    Get.lazyPut<IEarthquakeRestService>(() => EarthquakeRestService(), fenix: true);
  }
}
