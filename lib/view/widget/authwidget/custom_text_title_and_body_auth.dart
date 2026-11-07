import 'package:flutter/material.dart';

class CustomTextTitleAndBodyAuth extends StatelessWidget {
  CustomTextTitleAndBodyAuth({
    super.key,
    required this.welcom,
    required this.intrdouction,
  });
  String welcom;
  String intrdouction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            welcom,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          Text(
            intrdouction,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
