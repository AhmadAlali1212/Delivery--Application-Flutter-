import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getOrders() async {
    var respons = await crud.postData(AppLink.ordersPending, {});
    return respons.fold((l) => l, (r) => r);
  }

  ordersApprove(String deliveryid, String userid, String orderid) async {
    var respons = await crud.postData(AppLink.approve, {
      "deliveryid": deliveryid,
      "userid": userid,
      "orderid": orderid,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
