import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class VerificationCodeEmailData {
  Crud crud;
  VerificationCodeEmailData(this.crud);
  postData(String email, String verificationCode) async {
    var respons = await crud.postData(AppLink.verifyCodeEmail, {
      "email": email,
      "verifycode": verificationCode,
    });
    return respons.fold((l) => l, (r) => r);
  }

  Future<Object> reSend(String email) async {
    var respons = await crud.postData(AppLink.resend, {"email": email});
    return respons.fold((l) => l, (r) => r);
  }
}
