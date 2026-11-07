// import 'package:get/get.dart';

// class TestController extends GetxController {
//   TestData testData = TestData(Get.find());

//   List data = [];
//   late StatusRequset statusRequset;
//   Future<void> getData() async {
//     statusRequset = StatusRequset.loading;
//     var response = await testData.getData();
//     statusRequset = handdlingData(response);
//     if (statusRequset == StatusRequset.success) {
//       data = response;
//     } else {
//       print("$statusRequset");
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
