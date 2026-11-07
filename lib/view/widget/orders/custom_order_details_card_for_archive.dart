import 'package:ecommeceappcourse/controller/orders/orders_archive_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/data/model/orders_model.dart';
import 'package:ecommeceappcourse/view/widget/orders/show_rating_for_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomOrderDetailsCardForArchive
    extends GetView<OrdersArchiveController> {
  const CustomOrderDetailsCardForArchive({super.key, required this.ordersList});
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
                  "order_number".tr,
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
            Text(
              "orders_type".tr +
                  " ${controller.printDeliveryType("${ordersList.ordersType}")}",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),

            Text(
              "order_price".tr + " ${ordersList.ordersPrice}",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),

            Text(
              "price_delivery".tr + " ${ordersList.ordersPricedelivery}",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),

            Text(
              "orders_payment_method".tr +
                  " ${controller.printPaymentMethod("${ordersList.ordersPaymentmethod}")}",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "orders_status".tr +
                  " ${controller.printOrderStatus("${ordersList.ordersStatus}")}",
              style: TextStyle(
                color: const Color.fromARGB(255, 119, 117, 117),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "total_price_colon".tr + " ${ordersList.ordersTotalprice}",
                    style: TextStyle(
                      color: ColorConstant.puplerDistinct,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  if (ordersList.ordersRating == 0)
                    MaterialButton(
                      onPressed: () {
                        showRaingForOrder(context, ordersList);
                      },
                      color: ColorConstant.puplerLight,
                      child: Text("rating".tr),
                    ),
                  SizedBox(width: 3),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.orderDetails,
                        arguments: {"orderModeslList": ordersList},
                      );
                    },
                    color: ColorConstant.puplerLight,
                    child: Text("details".tr),
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
