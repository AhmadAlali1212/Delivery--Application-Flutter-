import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class VerificationCodeData {
  Crud crud;
  VerificationCodeData(this.crud);
  Future<Object> postData(String email, String verifycode) async {
    var respons = await crud.postData(AppLink.verificationCode, {
      "email": email,
      "verifycode": verifycode,
    });
    return respons.fold((l) => l, (r) => r);
  }

  Future<Object> reSend(String email) async {
    var respons = await crud.postData(AppLink.resend, {"email": email});
    return respons.fold((l) => l, (r) => r);
  }
}
