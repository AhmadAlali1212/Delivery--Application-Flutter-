import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomMaterialButtonDoneForTracking extends StatelessWidget {
  const CustomMaterialButtonDoneForTracking({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 13),
      onPressed: onPressed,
      color: ColorConstant.puplerDistinct,
      textColor: ColorConstant.whitePrimary,
      child: Text("Done Order", style: TextStyle(fontSize: 18)),
    );
  }
}
