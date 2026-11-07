import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String password) async {
    var respons = await crud.postData(AppLink.resetPassword, {
      "password": password,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
