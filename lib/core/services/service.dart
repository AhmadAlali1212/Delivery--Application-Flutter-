import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreference;
  Future<MyService> init() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.requestPermission();

    sharedPreference = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => MyService().init());
}
