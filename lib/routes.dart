import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/middleware/my_middle_ware.dart';
import 'package:deliveryapplication/view/home_screen.dart';
import 'package:deliveryapplication/view/screen/auth/login.dart';
import 'package:deliveryapplication/view/screen/checkEmail/forget_password.dart';
import 'package:deliveryapplication/view/screen/checkEmail/reset_password.dart';
import 'package:deliveryapplication/view/screen/checkEmail/success_reset_password.dart';
import 'package:deliveryapplication/view/screen/checkEmail/verification_email.dart';
import 'package:deliveryapplication/view/screen/orders/accepted.dart';
import 'package:deliveryapplication/view/screen/orders/order_details.dart';
import 'package:deliveryapplication/view/screen/orders/order_tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? route = [
  GetPage(name: "/", page: () => Login(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),

  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoutes.verificationEmail, page: () => VerificationEmail()),

  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.orderDetails, page: () => OrderDetails()),
  GetPage(name: AppRoutes.orderTracking, page: () => OrderTracking()),
  GetPage(name: AppRoutes.orderAccepted, page: () => OrdersAccepted()),
];
