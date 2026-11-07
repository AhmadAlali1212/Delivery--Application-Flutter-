import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/handlingdatacontroller.dart';
import 'package:deliveryapplication/data/datasource/remote/chechEmail/verificationCode_email_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AstractVerificationcodeEmailController extends GetxController {
  void verificationCodeEmail(String verificationCode) {}
  void toResetPassword() {}
}

class VerificationcodeEmailController
    extends AstractVerificationcodeEmailController {
  GlobalKey<FormState> fromState = GlobalKey<FormState>();
  String? email;
  StatusRequset statusRequset = StatusRequset.none;
  VerificationCodeEmailData verificationCodeData = VerificationCodeEmailData(
    Get.find(),
  );
  @override
  verificationCodeEmail(String verificationCode) async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await verificationCodeData.postData(
      email!,
      verificationCode,
    );
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "The Verification Code",
        );
      }
    } else {
      print("$statusRequset");
    }
    update();
  }

  @override
  toResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  void resend() {
    verificationCodeData.reSend(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
