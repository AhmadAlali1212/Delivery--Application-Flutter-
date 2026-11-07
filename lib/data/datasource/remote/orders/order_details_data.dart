import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  getOrders(String cartOrderid) async {
    var respons = await crud.postData(AppLink.details, {
      "orderid": cartOrderid,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
