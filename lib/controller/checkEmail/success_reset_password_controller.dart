import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class AbstractSuccessResetPasswordController extends GetxController {
  void toLogin() {}
}

class SuccessResetPasswordController
    extends AbstractSuccessResetPasswordController {
  @override
  toLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
