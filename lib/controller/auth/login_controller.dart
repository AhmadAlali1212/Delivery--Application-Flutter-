import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/handlingdatacontroller.dart';
import 'package:deliveryapplication/core/services/service.dart';
import 'package:deliveryapplication/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AstractLoginController extends GetxController {
  login() {}
  toSignUp() {}
  toForgetPassword() {}
  showPassword() {}
}

class LoginController extends AstractLoginController {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late bool isPassWordShow = true;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  StatusRequset statusRequset = StatusRequset.none;
  LoginData loginData = LoginData(Get.find());
  MyService myService = Get.find();

  @override
  showPassword() {
    isPassWordShow = !isPassWordShow;
    update();
  }

  @override
  login() async {
    var fromApp = fromState.currentState;
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("==============Controller:$response");
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['deliveryworkers_approve'] == 1) {
            myService.sharedPreference.setString(
              "id",
              response['data']['deliveryworkers_id'].toString(),
            );
            String deliveryid = myService.sharedPreference.getString("id")!;
            myService.sharedPreference.setString(
              "username",
              response['data']['deliveryworkers_name'],
            );
            myService.sharedPreference.setString(
              "email",
              response['data']['deliveryworkers_email'],
            );
            myService.sharedPreference.setString(
              "phone",
              response['data']['deliveryworkers_phone'],
            );
            myService.sharedPreference.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("deliveryworkers");
            FirebaseMessaging.instance.subscribeToTopic(
              "deliveryworkers$deliveryid",
            );

            Get.offAllNamed(AppRoutes.home);
          } else {
            Get.offNamed(
              AppRoutes.verificationCode,
              arguments: {"email": email.text},
            );
          }
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Or PassWord Is Wrong",
          );
        }
      } else {
        print("$statusRequset");
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  toSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  toForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    try {
      FirebaseMessaging.instance.getToken().then((value) {
        print(value);
        String? token = value;
      });
    } catch (e) {
      print("FCM Error: $e");
    }

    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
