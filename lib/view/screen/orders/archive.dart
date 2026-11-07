import 'package:ecommeceappcourse/controller/orders/orders_archive_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/view/widget/orders/custom_order_details_card_for_archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(title: Text("orders_archive".tr)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            GetBuilder<OrdersArchiveController>(
              builder: (controller) => HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CustomOrderDetailsCardForArchive(
                      ordersList: controller.data[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
