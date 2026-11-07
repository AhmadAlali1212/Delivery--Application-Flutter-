import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CuustomTextFormField extends StatelessWidget {
  CuustomTextFormField({
    super.key,
    this.obscureText,
    this.onTapIcon,
    required this.labelName,
    required this.iconData,
    required this.hint,
    required this.validator,
    required this.isNumber,
    required this.mycontroller,
  });

  String labelName;
  String hint;
  IconData iconData;
  Function()? onTapIcon;
  bool isNumber;
  bool? obscureText = false;
  String? Function(String?)? validator;
  final TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber == true
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      obscureText: obscureText == null || obscureText == false ? false : true,
      validator: validator,
      controller: mycontroller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          labelName,
          style: TextStyle(color: ColorConstant.puplerDistinct),
        ),
        suffixIcon: InkWell(
          onTap: onTapIcon,
          child: Icon(iconData, color: ColorConstant.puplerLight),
        ),
        hint: Text(
          hint,
          style: TextStyle(color: ColorConstant.puplerLight, fontSize: 16),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
