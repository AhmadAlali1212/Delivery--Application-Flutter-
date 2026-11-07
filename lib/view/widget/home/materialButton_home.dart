import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class MaterialButtonHome extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final String text;
  final bool active;
  const MaterialButtonHome({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
    required this.active,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 35,
            color: active == true
                ? ColorConstant.puplerDistinct
                : ColorConstant.blackPrimary,
          ),
          Text(
            text,
            style: TextStyle(
              color: active == true
                  ? ColorConstant.puplerDistinct
                  : ColorConstant.blackPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
