import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomDoHaveAccount extends StatelessWidget {
  CustomDoHaveAccount({
    super.key,
    required this.onTap,
    required this.text1,
    required this.text2,
  });
  Function()? onTap;
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
              color: ColorConstant.puplerDistinct,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
