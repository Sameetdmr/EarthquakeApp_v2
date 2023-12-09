class IExceptionHandlingService {
  void handleException(dynamic exception) {}
}

class ExceptionHandlingService implements IExceptionHandlingService {
  @override
  void handleException(dynamic exception) {
    /*
    FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(
      exception: exception,
      stack: StackTrace.current,
    ));
    */
  }
}
