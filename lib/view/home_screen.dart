import 'dart:io';

import 'package:deliveryapplication/controller/home_screen_controller.dart';
import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:deliveryapplication/view/widget/home/materialButton_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorConstant.whitePrimary,
        appBar: AppBar(title: Text("Orders")),
        bottomNavigationBar: BottomAppBar(
          height: 79,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: const Color.fromARGB(255, 249, 248, 248),
          child: Row(
            children: [
              ...List.generate(controller.homePageList.length, ((index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MaterialButtonHome(
                    onPressed: () {
                      controller.changedPage(index);
                    },
                    icon: controller.homeScreenIcon[index],
                    text: controller.homeScreenTitle[index],
                    active: controller.currentPage == index ? true : false,
                  ),
                );
              })),
            ],
          ),

          // Row(
          //   children: [
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(0);
          //       },
          //       icon: Icons.home,
          //       text: "Home",
          //       active: controller.currentPage == 0 ? true : false,
          //     ),
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(1);
          //       },
          //       icon: Icons.settings,
          //       text: "Settings",
          //       active: controller.currentPage == 1 ? true : false,
          //     ),
          //   ],
          // ),
          // Spacer(),
          // Row(
          //   children: [
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(2);
          //       },
          //       icon: Icons.favorite,
          //       text: "Favorite",
          //       active: controller.currentPage == 2 ? true : false,
          //     ),
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(3);
          //       },
          //       icon: Icons.person,
          //       text: "Person",
          //       active: controller.currentPage == 3 ? true : false,
          //     ),
          //   ],
          // ),
          //    ],
        ),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, t) {
            if (didPop) return;
            Get.defaultDialog(
              title: "Warning",

              middleText: "Do yoy want to Exit of the application",
              onCancel: () {},
              cancelTextColor: ColorConstant.puplerDistinct,
              confirmTextColor: ColorConstant.puplerDistinct,
              buttonColor: ColorConstant.puplerLight,
              onConfirm: () {
                exit(0);
              },
            );
          },
          child: controller.homePageList.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
