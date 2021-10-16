import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  String lable;
  TextEditingController controller;
  bool? isObscure;
  TextInputType? keyboardType;
  String? Function(String?)? validator;

  CommonTextField(
    this.lable,
    this.controller, {
    this.isObscure: false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      validator: validator,
      obscureText: isObscure!,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: "$lable",
          border: OutlineInputBorder(borderSide: BorderSide())),
    ));
  }
}
