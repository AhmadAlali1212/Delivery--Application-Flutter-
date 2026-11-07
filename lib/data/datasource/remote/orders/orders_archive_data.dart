import 'package:deliveryapplication/core/class/crud.dart';
import 'package:deliveryapplication/core/constant/app_link.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getOrders(String deliveryid) async {
    var respons = await crud.postData(AppLink.archive, {
      "deliveryid": deliveryid,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
