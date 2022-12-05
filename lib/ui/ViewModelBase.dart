import 'package:get/get.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../interfaces/common/IExceptionHandlingService.dart';
import '../utils/servicelocator/ServiceLocator.dart';

class ViewModelBase extends GetxController {
  IExceptionHandlingService exceptionHandlingService = ServiceLocator().get<IExceptionHandlingService>();

  setCurrentScreen(String screenName) async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.setCurrentScreen(screenName: screenName, screenClassOverride: screenName);
  }
}
