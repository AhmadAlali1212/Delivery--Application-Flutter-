import 'package:deliveryapplication/controller/auth/login_controller.dart';
import 'package:deliveryapplication/controller/checkEmail/forget_password_controller.dart';
import 'package:deliveryapplication/controller/checkEmail/reset_password_controller.dart';
import 'package:deliveryapplication/controller/checkEmail/verificationCode_email_controller.dart';
import 'package:deliveryapplication/controller/home_screen_controller.dart';
import 'package:deliveryapplication/controller/orders/order_details_controller.dart';
import 'package:deliveryapplication/controller/orders/orders_accepted_controller.dart';
import 'package:deliveryapplication/controller/orders/orders_pending_controller.dart';
import 'package:deliveryapplication/controller/orders/tracking_controller.dart';
import 'package:deliveryapplication/controller/setting_controller.dart';
import 'package:deliveryapplication/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => VerificationcodeEmailController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => OrdersPendingController(), fenix: true);
    Get.lazyPut(() => OrdersPendingController(), fenix: true);
    Get.lazyPut(() => OrdersAcceptedController(), fenix: true);
    Get.lazyPut(() => OrderDetailsController(), fenix: true);
    Get.lazyPut(() => SettingCnontroller(), fenix: true);
    Get.lazyPut(() => TrackingController(), fenix: true);

    //  Get.put(() => TestController());
    Get.lazyPut(() => Crud(), fenix: true);
  }
}
