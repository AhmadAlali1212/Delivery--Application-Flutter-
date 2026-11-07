import 'package:deliveryapplication/controller/checkEmail/reset_password_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/core/functions/validator_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/cuustom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      body: GetBuilder<ResetPasswordController>(
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
                    welcom: "New Password",
                    intrdouction: "Please Enter New Password",
                  ),
                  SizedBox(height: 30),
                  CuustomTextFormField(
                    validator: (val) {
                      validator(val!, 8, 100, "password");
                      return null;
                    },
                    isNumber: false,
                    mycontroller: controller.password,
                    labelName: "Password",
                    hint: "Enter New Password",
                    iconData: Icons.password_outlined,
                  ),
                  SizedBox(height: 20),
                  CuustomTextFormField(
                    validator: (val) {
                      validator(val!, 8, 100, "password");
                      return null;
                    },
                    isNumber: false,
                    mycontroller: controller.repairPassword,
                    labelName: "Repair Password",
                    hint: "Enter New Password Again",
                    iconData: Icons.password_outlined,
                  ),
                  SizedBox(height: 20),
                  CustomMaterialButtonAuth(
                    onPressed: () {
                      controller.toSuccessResetPassword();
                    },
                    text: "Save",
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
