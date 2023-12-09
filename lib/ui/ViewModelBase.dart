import 'package:depremapp/services/common/ExceptionHandlingService.dart';
import 'package:get/get.dart';

import '../utils/servicelocator/ServiceLocator.dart';

class ViewModelBase extends GetxController {
  IExceptionHandlingService exceptionHandlingService = ServiceLocator().get<IExceptionHandlingService>();

/*
  setCurrentScreen(String screenName) async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.setCurrentScreen(screenName: screenName, screenClassOverride: screenName);
  }
  */
}
