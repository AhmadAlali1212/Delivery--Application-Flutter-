import 'package:deliveryapplication/core/services/service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

String TranslateDataBase(String columnAr, String columnEn) {
  MyService myService = Get.find();
  if (myService.sharedPreference.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
