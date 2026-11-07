import 'package:deliveryapplication/controller/orders/orders_pending_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/view/widget/orders/custom_order_details_card_for_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            GetBuilder<OrdersPendingController>(
              builder: (controller) => HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CustomOrderDetailsCardForPending(
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
