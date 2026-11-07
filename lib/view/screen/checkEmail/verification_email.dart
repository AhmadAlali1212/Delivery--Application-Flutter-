import 'package:deliveryapplication/controller/checkEmail/verificationCode_email_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationEmail extends StatelessWidget {
  const VerificationEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Verification",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: GetBuilder<VerificationcodeEmailController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                SizedBox(height: 30),
                CustomTextTitleAndBodyAuth(
                  welcom: "Verification Email",
                  intrdouction: "Please Enter Verification Code Foe Email ",
                ),
                SizedBox(height: 30),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.verificationCodeEmail(verificationCode);
                  }, // end onSubmit
                ),

                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    controller.resend();
                  },
                  child: Text(
                    "Resend VerificationCode",
                    style: TextStyle(color: ColorConstant.puplerDistinct),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
