import 'package:depremapp/services/common/ExceptionHandlingService.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

import '../utils/servicelocator/ServiceLocator.dart';

class ViewModelBase extends GetxController {
  IExceptionHandlingService exceptionHandlingService = ServiceLocator().get<IExceptionHandlingService>();

  Future<void> setCurrentScreen(String screenName) async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await analytics.setCurrentScreen(screenName: screenName, screenClassOverride: screenName);
  }
}
