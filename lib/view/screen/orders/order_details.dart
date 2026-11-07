import 'package:deliveryapplication/controller/orders/order_details_controller.dart';
import 'package:deliveryapplication/core/class/handlind_data_view.dart';
import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:deliveryapplication/view/widget/orders/custom_material_button_tracking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        child: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlindDataView(
            statusRequset: controller.statusRequset,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  Center(
                                    child: Text(
                                      "Item",
                                      style: TextStyle(
                                        color: ColorConstant.puplerDistinct,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "QTY",
                                      style: TextStyle(
                                        color: ColorConstant.puplerDistinct,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Price",
                                      style: TextStyle(
                                        color: ColorConstant.puplerDistinct,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(
                                  children: [
                                    Center(
                                      child: Text(
                                        "${controller.data[index].itemsName}",
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "${controller.data[index].itemsCount}",
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "${controller.data[index].priceItems}\$",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Total Price:${controller.ordersModel.ordersTotalprice}\$",
                            style: TextStyle(
                              color: ColorConstant.puplerDistinct,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (controller.ordersModel.ordersType == 0)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Container(
                          padding: EdgeInsets.only(bottom: 14),
                          child: Text(
                            "${controller.ordersModel.addressName}",
                            style: TextStyle(
                              color: ColorConstant.puplerDistinct,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.only(bottom: 4),

                          child: Text(
                            "${controller.ordersModel.addressCity}  ${controller.ordersModel.addressStreet}  ${controller.ordersModel.addressBuilding}",
                            style: TextStyle(
                              color: ColorConstant.blackPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 12),
                if (controller.ordersModel.ordersType == 0)
                  if (controller.kGooglePlex != null)
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        height: 300,

                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),

                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllerMap) {
                            controller.completerController!.complete(
                              controllerMap,
                            );
                          },
                        ),
                      ),
                    ),
                SizedBox(height: 12),
                if (controller.ordersModel.ordersType == 0 &&
                    controller.ordersModel.ordersStatus == 3)
                  CustomMaterialButtonTracking(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.orderTracking,
                        arguments: {"orderModeslList": controller.ordersModel},
                      );
                    },
                    text: "Tracking Order",
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
