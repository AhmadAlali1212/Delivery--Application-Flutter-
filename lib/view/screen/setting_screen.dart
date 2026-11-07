import 'package:deliveryapplication/controller/setting_controller.dart';
import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:deliveryapplication/core/constant/image_assest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(color: ColorConstant.puplerDistinct),
              ),
              Positioned(
                right: 165,
                top: Get.width / 3,

                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: ColorConstant.whitePrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(ImageAssest.avatar),
                    radius: 40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          GetBuilder<SettingCnontroller>(
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: Column(
                  children: [
                    ...List.generate(controller.settingList.length, (index) {
                      return controller.settingList[index];
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
