class AppLink {
  static const String server =
      "http://10.0.2.2/ecommeceapp/deliveryApplication";
  static const String test = "$server/test.php";
  //                      Auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verificationCode = "$server/auth/verify_code.php";
  static const String resend = "$server/auth/resend.php";

  //                      Forget Password

  static const String forgetPasswordData =
      "$server/forgetpassword/check_email.php";
  static const String verifyCodeEmail =
      "$server/forgetpassword/verify_code_email.php";
  static const String resetPassword =
      "$server/forgetpassword/reset_password.php";

  //     Orders
  static const String ordersPending = "$server/orders/pending.php";
  static const String ordersAccepted = "$server/orders/accepted.php";
  static const String archive = "$server/orders/archive.php";
  static const String details = "$server/orders/details.php";
  static const String approve = "$server/orders/approve.php";
  static const String done = "$server/orders/done.php";
}
