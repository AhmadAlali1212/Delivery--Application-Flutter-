import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/handlingdatacontroller.dart';
import 'package:deliveryapplication/data/datasource/remote/chechEmail/forget_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AstractForgetPasswordController extends GetxController {
  void forgetPassword() {}
  void toVerificationCode() {}
}

class ForgetPasswordController extends AstractForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  StatusRequset statusRequset = StatusRequset.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  @override
  forgetPassword() {}

  @override
  toVerificationCode() async {
    var fromApp = fromState.currentState;
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await forgetPasswordData.postData(email.text);
      print("==============Controller:$response");

      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(
            AppRoutes.verificationEmail,
            arguments: {"email": email.text},
          );
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email Is Not Exit");
        }
      } else {
        print("$statusRequset");
      }
      update();
    } else {
      print("Not Valid");
    }
    Get.offNamed(AppRoutes.verificationEmail);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
