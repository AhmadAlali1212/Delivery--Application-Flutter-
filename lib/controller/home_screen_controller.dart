import 'package:deliveryapplication/view/screen/orders/accepted.dart';
import 'package:deliveryapplication/view/screen/orders/pending.dart';
import 'package:deliveryapplication/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenControllerAbstract extends GetxController {
  changedPage(int i);
}

class HomeScreenController extends HomeScreenControllerAbstract {
  List<Widget> homePageList = [
    OrdersPending(),
    OrdersAccepted(),
    SettingScreen(),
  ];
  List<IconData> homeScreenIcon = [
    Icons.home,
    Icons.settings,
    Icons.notifications_active_outlined,
  ];
  List<String> homeScreenTitle = ["Pending", "Accepted", "Setting"];

  int currentPage = 0;
  @override
  changedPage(int i) {
    currentPage = i;
    update();
  }
}
