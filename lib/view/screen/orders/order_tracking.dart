import 'package:deliveryapplication/controller/orders/tracking_controller.dart';
import 'package:deliveryapplication/view/widget/orders/custom_materail_botton__done_for_tracking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTracking extends GetView<TrackingController> {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Tracking")),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),

        child: CustomMaterialButtonDoneForTracking(
          onPressed: () {
            controller.orderDone();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: double.infinity,
        child: GetBuilder<TrackingController>(
          builder: (controller) {
            if (controller.kGooglePlex == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              mapType: MapType.normal,
              markers: controller.markers.toSet(),
              polylines: controller.polyLineSet,
              initialCameraPosition: controller.kGooglePlex!,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              rotateGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controllerMap) {
                controller.gms = controllerMap;
              },
            );
          },
        ),
      ),
    );
  }
}
