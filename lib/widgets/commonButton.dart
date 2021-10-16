import 'package:appentus_task/utils/colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {

  String buttonText;
  VoidCallback onTap;


  CommonButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onTap,
      color: AppColor.primaryColor,
    child: Text('$buttonText', style: TextStyle(color: AppColor.buttonTextColor)),
    );
  }
}
