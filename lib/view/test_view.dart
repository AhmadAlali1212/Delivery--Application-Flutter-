// import 'package:deliveryapplication/controller/test_controller.dart';
// import 'package:deliveryapplication/core/class/handlind_data_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TestView extends StatelessWidget {
//   const TestView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//       appBar: AppBar(title: Text("Test")),
//       body: GetBuilder<TestController>(
//         builder: (controller) {
//           return HandlindDataView(
//             statusRequset: controller.statusRequset,
//             widget: ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) {
//                 return Text("${controller.data}");
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
