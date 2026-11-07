import 'package:deliveryapplication/controller/orders/orders_accepted_controller.dart';
import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:deliveryapplication/data/datasource/static/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

class CustomOrderDetailsCardForAccepted
    extends GetView<OrdersAcceptedController> {
  const CustomOrderDetailsCardForAccepted({
    super.key,
    required this.ordersList,
  });
  final OrdersModel ordersList;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number:",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 119, 117, 117),
                    fontSize: 18,
                  ),
                ),
                Text(
                  "  #${ordersList.ordersId}",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 119, 117, 117),
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Text(
                  " ${Jiffy.parse(ordersList.ordersDatetime!).fromNow()}",
                  style: TextStyle(color: ColorConstant.puplerDistinct),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Text(
            //   "Orders Type: ${controller.printDeliveryType("${ordersList.ordersType}")}",
            //   style: TextStyle(
            //     color: const Color.fromARGB(255, 119, 117, 117),
            //     fontSize: 18,
            //   ),
            // ),
            // SizedBox(height: 4),
            Text(
              "Order Price: ${ordersList.ordersPrice}\$",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),

            Text(
              "Price Delivery: ${ordersList.ordersPricedelivery}\$",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),

            Text(
              "Orders Payment Method: ${controller.printPaymentMethod("${ordersList.ordersPaymentmethod}")}",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            // Text(
            //   "Orders Status: ${controller.printOrderStatus("${ordersList.ordersStatus}")}",
            //   style: TextStyle(
            //     color: const Color.fromARGB(255, 119, 117, 117),
            //     fontSize: 18,
            //   ),
            // ),
            // SizedBox(height: 4),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Total Price: ${ordersList.ordersTotalprice}\$",
                    style: TextStyle(
                      color: ColorConstant.puplerDistinct,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),

                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.orderDetails,
                        arguments: {"orderModeslList": ordersList},
                      );
                    },
                    color: ColorConstant.puplerLight,
                    child: Text("Details"),
                  ),
                  SizedBox(width: 3),

                  if (ordersList.ordersStatus == 3)
                    MaterialButton(
                      onPressed: () {
                        controller.orderDone(
                          ordersList.ordersUserid.toString(),
                          ordersList.ordersId.toString(),
                        );
                      },
                      color: ColorConstant.puplerLight,
                      child: Text("Done"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
