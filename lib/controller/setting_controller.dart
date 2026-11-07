import 'package:deliveryapplication/core/constant/app_routes.dart';
import 'package:deliveryapplication/core/services/service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingCnontrollerAbstract extends GetxController {}

class SettingCnontroller extends SettingCnontrollerAbstract {
  MyService myService = MyService();
  List<Widget> get settingList => [
    ListTile(
      onTap: () {
        Get.toNamed(AppRoutes.ordersPending);
      },
      trailing: Icon(Icons.production_quantity_limits_outlined),
      title: Text("Orders"),
    ),

    ListTile(
      onTap: () {},
      trailing: Icon(Icons.help_outline_outlined),
      title: Text("About"),
    ),
    ListTile(
      onTap: () {
        launchUrl(Uri.parse("tel:+0994124214"));
      },
      trailing: Icon(Icons.phone_callback_outlined),
      title: Text("Contact us"),
    ),
    ListTile(
      onTap: () {
        String userid = myService.sharedPreference.getString("id")!;
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
      },
      trailing: Icon(Icons.logout_outlined),
      title: Text("Logout"),
    ),
  ];
}
