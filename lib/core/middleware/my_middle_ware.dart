import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyService myService = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreference.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.home);
    }
    if (myService.sharedPreference.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
