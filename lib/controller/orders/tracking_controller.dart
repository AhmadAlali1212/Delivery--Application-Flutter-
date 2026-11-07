import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryapplication/controller/orders/orders_accepted_controller.dart';
import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:deliveryapplication/core/functions/get_decode_poly_line.dart';
import 'package:deliveryapplication/core/services/service.dart';
import 'package:deliveryapplication/data/datasource/static/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  MyService myService = Get.find();

  StatusRequset statusRequset = StatusRequset.loading;
  late OrdersModel ordersModel;
  Set<Polyline> polyLineSet = {};
  GoogleMapController? gms;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? destlat;
  double? destlong;
  double? currentLat;
  double? currentLong;
  StreamSubscription<Position>? positionSubscription;
  Timer? timer;
  OrdersAcceptedController ordersAcceptedController =
      OrdersAcceptedController();

  getCurrentLocation() async {
    markers.add(
      Marker(
        markerId: MarkerId("Dest"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      ),
    );

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      print('Location permission denied');
      kGooglePlex = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 16,
      );
      update();
      return;
    }

    try {
      Position initialPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLat = initialPosition.latitude;
      currentLong = initialPosition.longitude;

      kGooglePlex = CameraPosition(
        target: LatLng(currentLat!, currentLong!),
        zoom: 16,
      );

      markers.removeWhere((m) => m.markerId.value == "Curr");
      markers.add(
        Marker(
          markerId: MarkerId("Curr"),
          position: LatLng(currentLat!, currentLong!),
        ),
      );

      update();
      await initPolyLine();
    } catch (e) {
      print('Failed to get initial position: $e');
      kGooglePlex = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 16,
      );
      update();
    }

    positionSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
          (Position position) {
            currentLat = position.latitude;
            currentLong = position.longitude;

            if (gms != null) {
              gms!.animateCamera(
                CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)),
              );
            }

            markers.removeWhere((element) => element.markerId.value == "Curr");
            markers.add(
              Marker(
                markerId: MarkerId("Curr"),
                position: LatLng(position.latitude, position.longitude),
              ),
            );
            update();
          },
        );
  }

  refreshLocation() async {
    await Future.delayed(Duration(seconds: 2));
    print(currentLat);
    print(currentLong);
    print(ordersModel.ordersId);
    timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      try {
        await FirebaseFirestore.instance
            .collection("delivery")
            .doc(ordersModel.ordersId.toString())
            .set({
              "lat": currentLat,
              "long": currentLong,
              "deliveryid": myService.sharedPreference
                  .getString("id")
                  .toString(),
            });

        print("Location Updated");
      } catch (e) {
        print("Firestore Error = $e");
      }
    });
  }

  initPolyLine() async {
    destlat = ordersModel.addressLat!;
    destlong = ordersModel.addressLong!;
    int attempts = 0;
    while ((currentLat == null || currentLong == null) && attempts < 10) {
      await Future.delayed(const Duration(milliseconds: 300));
      attempts++;
    }

    if (currentLat == null || currentLong == null) {
      print('Cannot init polyline: current location unavailable');
      return;
    }

    try {
      polyLineSet = await getDecodePolyLine(
        currentLat!,
        currentLong!,
        destlat!,
        destlong!,
      );
      update();
    } catch (e) {
      print('Error decoding polyline: $e');
    }
  }

  orderDone() async {
    statusRequset = StatusRequset.loading;
    update();
    await ordersAcceptedController.orderDone(
      ordersModel.ordersUserid.toString(),
      ordersModel.ordersId.toString(),
    );

    Get.offAllNamed(AppRoutes.home);

    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["orderModeslList"];
    getCurrentLocation();
    refreshLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionSubscription?.cancel();
    gms?.dispose();
    timer?.cancel();
    super.onClose();
  }
}
