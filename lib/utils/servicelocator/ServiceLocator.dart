import 'package:get/get.dart';

import '../../interfaces/common/IExceptionHandlingService.dart';
import '../../services/common/ExceptionHandlingService.dart';

class ServiceLocator {
  static final ServiceLocator _singleton = ServiceLocator._internal();

  ServiceLocator._internal();

  factory ServiceLocator() {
    return _singleton;
  }

  get<T>() {
    return Get.find<T>();
  }

  init() {
    Get.lazyPut<IExceptionHandlingService>(() => ExceptionHandlingService(), fenix: true);
  }
}
