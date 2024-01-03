import 'dart:async';
import 'dart:io';

import 'package:depremapp/utils/servicelocator/ServiceLocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable
final class ProjectInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
    ServiceLocator().init();
  }

  Future<void> _initialize() async {
    await Firebase.initializeApp();
    await DeviceUtility.instance.initPackageInfo(); // System data read or kartal package
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    FlutterError.onError = (FlutterErrorDetails details) async {
      await FirebaseCrashlytics.instance.log('${StackTrace.current.toString()} / ${details.exceptionAsString()}');
      await FirebaseCrashlytics.instance.recordError('${details.exceptionAsString()}', StackTrace.current, printDetails: true, fatal: true);
      Logger().e(details.exceptionAsString());

      exit(1);
    };
  }
}
