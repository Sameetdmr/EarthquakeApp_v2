import '../../utils/navigation/CustomNavigator.dart';
import '../ViewModelBase.dart';
import '../home/HomePage.dart';

class SplashPageViewModel extends ViewModelBase {
  SplashPageViewModel() {
    initPage();
    setCurrentScreen("Splash Page");
  }

  void initPage() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      isStart();
    } catch (ex) {
      await exceptionHandlingService.handleException(ex);
    }
  }

  void isStart() {
    CustomNavigator().pushAndRemoveUntil(HomePage());
  }
}
