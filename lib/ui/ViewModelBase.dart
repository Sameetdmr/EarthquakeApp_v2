import 'package:get/get.dart';

import '../interfaces/common/IExceptionHandlingService.dart';
import '../utils/servicelocator/ServiceLocator.dart';

class ViewModelBase extends GetxController {
  IExceptionHandlingService exceptionHandlingService = ServiceLocator().get<IExceptionHandlingService>();
}
