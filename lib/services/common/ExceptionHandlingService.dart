import 'package:depremapp/utils/popups/CustomDialog.dart';
import 'package:depremapp/utils/popups/CustomDialogType.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class IExceptionHandlingService {
  Future<void> handleException(dynamic exception);
}

class ExceptionHandlingService implements IExceptionHandlingService {
  @override
  Future<void> handleException(dynamic exception) async {
    String errorMessage = exception.toString();
    String message = errorMessage.split(":")[1].trim();
    await FirebaseCrashlytics.instance.log('${StackTrace.current.toString()} / $message');
    await FirebaseCrashlytics.instance.recordError('$message', StackTrace.current, printDetails: true);

    CustomDialog.showGenericDialog(CustomDialogType.ERROR, null, message, true);
  }
}
