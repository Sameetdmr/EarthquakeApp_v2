import '../../utils/navigation/CustomNavigator.dart';
import '../ViewModelBase.dart';
import '../home/HomePage.dart';

class SplashPageViewModel extends ViewModelBase {
  SplashPageViewModel() {
    initPage();
    setCurrentScreen("Splash Page");
  }

  initPage() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await isStart();
    } catch (ex) {
      exceptionHandlingService.handleException(ex);
    }
  }

  isStart() async {
    CustomNavigator().pushAndRemoveUntil(HomePage());
  }
}
