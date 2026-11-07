import 'package:deliveryapplication/core/constant/app_theme.dart';
import 'package:deliveryapplication/core/functions/fcmconfig.dart';
import 'package:deliveryapplication/core/services/service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ChangedLocal extends GetxController {
  Locale? language;
  MyService myService = Get.find();
  ThemeData appTheme = appThemeEnglish;
  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    appTheme = langCode == "ar" ? appThemeArabic : appThemeEnglish;
    myService.sharedPreference.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  Future<Object> requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمة تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
        "تنبيه",
        "لايمكن تشغيل التطبيق من دون اعطاء صلاحية الموقع",
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    requsetPermissionNotficiton();
    fcmConfig();
    requestPerLocation();
    String? sharedPreflang = myService.sharedPreference.getString("lang");
    if (sharedPreflang == "ar") {
      language = const Locale("ar");
      appTheme = appThemeArabic;
    } else if (sharedPreflang == "en") {
      language = const Locale("en");
      appTheme = appThemeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = appThemeEnglish;
    }
    super.onInit();
  }
}
