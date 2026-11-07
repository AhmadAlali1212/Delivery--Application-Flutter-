import 'package:deliveryapplication/controller/auth/login_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/core/constant/image_assest.dart';
import 'package:deliveryapplication/core/functions/exit_alert.dart';
import 'package:deliveryapplication/core/functions/validator_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_do_have_account.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_material_button_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/custom_text_title_and_body_auth.dart';
import 'package:deliveryapplication/view/widget/authwidget/cuustom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login", style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, t) {
          if (didPop) return;
          exitAlret();
        },
        child: GetBuilder<LoginController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: controller.fromState,
                child: ListView(
                  children: [
                    Image(
                      image: AssetImage(ImageAssest.LogoImage),
                      width: 400,
                      height: 250,
                    ),
                    CustomTextTitleAndBodyAuth(
                      welcom: "Welcom Back",
                      intrdouction: "Login with your email and password",
                    ),
                    SizedBox(height: 30),
                    CuustomTextFormField(
                      validator: (val) {
                        if (val == null) return "Field is required";
                        return validator(val, 10, 100, "email");
                      },
                      isNumber: false,
                      mycontroller: controller.email,
                      labelName: "Email",
                      hint: "Enter Your Email",
                      iconData: Icons.email_outlined,
                    ),

                    SizedBox(height: 20),
                    GetBuilder<LoginController>(
                      builder: (controller) {
                        return CuustomTextFormField(
                          validator: (val) {
                            if (val == null) return "Field is required";
                            return validator(val, 8, 100, "password");
                          },
                          obscureText: controller.isPassWordShow,
                          iconData: Icons.lock_outlined,
                          isNumber: false,
                          mycontroller: controller.password,
                          labelName: "Password",
                          hint: "Enter Your Password",
                          onTapIcon: () {
                            controller.showPassword();
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        controller.toForgetPassword();
                      },
                      child: Text("Forget Password", textAlign: TextAlign.end),
                    ),
                    SizedBox(height: 20),
                    CustomMaterialButtonAuth(
                      onPressed: () {
                        controller.login();
                      },
                      text: "Login",
                    ),
                    SizedBox(height: 30),
                    CustomDoHaveAccount(
                      onTap: () {
                        controller.toSignUp();
                      },
                      text1: "Don't have an account? ",
                      text2: "SignUp",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
