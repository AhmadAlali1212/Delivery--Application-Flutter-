import 'package:deliveryapplication/controller/orders/orders_accepted_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/view/widget/orders/custom_order_details_card_for_accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            GetBuilder<OrdersAcceptedController>(
              builder: (controller) => HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CustomOrderDetailsCardForAccepted(
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
