import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/handlingdatacontroller.dart';
import 'package:deliveryapplication/core/services/service.dart';
import 'package:deliveryapplication/data/datasource/remote/orders/orders_accepted_data.dart';
import 'package:deliveryapplication/data/datasource/remote/orders/orders_pending_data.dart';
import 'package:deliveryapplication/data/datasource/static/model/orders_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class OrdersAcceptedControllerAbstract extends GetxController {
  printPaymentMethod(String val);
  printDeliveryType(String val);
  printOrderStatus(String val);
  orderDone(String userid, String orderid);

  getOrders();
}

class OrdersAcceptedController extends OrdersAcceptedControllerAbstract {
  MyService myService = Get.find();
  List<OrdersModel> data = [];
  StatusRequset statusRequset = StatusRequset.none;
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());
  @override
  printDeliveryType(val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  @override
  printPaymentMethod(val) {
    if (val == '0') {
      return "Cach On Delivery";
    } else {
      return "Payment Card";
    }
  }

  @override
  printOrderStatus(val) {
    if (val == '0') {
      return "Pending Approval";
    } else if (val == '1') {
      return "The Order is being Prepared";
    } else if (val == '2') {
      return "Ready To Picked up by Delivery man";
    } else if (val == '3') {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  getOrders() async {
    statusRequset = StatusRequset.loading;
    update();

    var response = await ordersAcceptedData.getOrders(
      myService.sharedPreference.getString("id")!,
    );

    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.serviceFailure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  @override
  orderDone(userid, orderid) async {
    statusRequset = StatusRequset.loading;
    update();
    var response = await ordersAcceptedData.ordersDone(
      myService.sharedPreference.getString("id")!,
      userid,
      orderid,
    );
    print(response);
    statusRequset = handdlingData(response);
    if (statusRequset == StatusRequset.success) {
      if (response["status"] == "success") {
        refreshOrderStatus();
      } else {
        statusRequset = StatusRequset.failure;
      }
    } else {
      statusRequset = StatusRequset.failure;
    }

    update();
  }

  refreshOrderStatus() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
