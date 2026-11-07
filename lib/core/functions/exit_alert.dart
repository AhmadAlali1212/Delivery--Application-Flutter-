import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void exitAlret() {
  Future.delayed(Duration.zero, () {
    Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل أنت متأكد من أغلاق التطبيق",
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("Yes"),
        ),

        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Canel"),
        ),
      ],
    );
  });
}
