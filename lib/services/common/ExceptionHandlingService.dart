import '../../interfaces/common/IExceptionHandlingService.dart';

class ExceptionHandlingService implements IExceptionHandlingService {
  @override
  handleException(dynamic exception) {
    /*
    FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(
      exception: exception,
      stack: StackTrace.current,
    ));
    */
  }
}
