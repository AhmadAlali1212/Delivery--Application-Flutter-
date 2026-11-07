import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getOrders(String deliveryid) async {
    var respons = await crud.postData(AppLink.ordersAccepted, {
      "deliveryid": deliveryid,
    });
    return respons.fold((l) => l, (r) => r);
  }

  ordersDone(String deliveryid, String userid, String orderid) async {
    var respons = await crud.postData(AppLink.done, {
      "deliveryid": deliveryid,
      "userid": userid,
      "orderid": orderid,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
