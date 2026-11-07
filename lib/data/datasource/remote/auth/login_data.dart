import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var respons = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
