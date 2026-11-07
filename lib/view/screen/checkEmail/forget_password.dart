import 'package:deliveryapplication/controller/checkEmail/forget_password_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/core/functions/validator_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/cuustom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) => HandlindDataView(
          statusRequset: controller.statusRequset,
          widget: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: controller.fromState,
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  CustomTextTitleAndBodyAuth(
                    welcom: "Check Email",
                    intrdouction: "Please Enter The Email For Verification",
                  ),
                  SizedBox(height: 30),
                  CuustomTextFormField(
                    validator: (val) {
                      validator(val!, 10, 100, "email");
                      return null;
                    },
                    isNumber: false,
                    mycontroller: controller.email,
                    labelName: "Email",
                    hint: "Enter Your Email",
                    iconData: Icons.email_outlined,
                  ),

                  SizedBox(height: 20),
                  CustomMaterialButtonAuth(
                    onPressed: () {
                      controller.toVerificationCode();
                    },
                    text: "Check",
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
