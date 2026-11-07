import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/handlingdatacontroller.dart';
import 'package:deliveryapplication/data/datasource/remote/chechEmail/reset_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AstractResetPasswordController extends GetxController {
  void resetPassword() {}
  void toSuccessResetPassword() {}
}

class ResetPasswordController extends AstractResetPasswordController {
  late TextEditingController password;
  late TextEditingController repairPassword;
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  StatusRequset statusRequset = StatusRequset.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  resetPassword() {}

  @override
  toSuccessResetPassword() async {
    var fromApp = fromState.currentState;
    if (password.text != repairPassword.text) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Have To Be Like Password ",
      );
    }
    if (fromApp!.validate()) {
      statusRequset = StatusRequset.loading;
      update();
      var response = await resetPasswordData.postData(password.text);
      statusRequset = handdlingData(response);
      if (statusRequset == StatusRequset.success) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Phone Or Email Already Exist",
          );
        }
      } else {
        print("$statusRequset");
      }
      update();
    } else {
      print("Not Valid");
    }
    Get.toNamed(AppRoutes.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repairPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repairPassword.dispose();
    super.dispose();
  }
}
