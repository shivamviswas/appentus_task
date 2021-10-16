import 'dart:convert';

import 'package:appentus_task/controllers/siginupController.dart';
import 'package:appentus_task/utils/inputValidation.dart';
import 'package:appentus_task/widgets/circleContainer.dart';
import 'package:appentus_task/widgets/commonButton.dart';
import 'package:appentus_task/widgets/commonTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget with InputValidationMixin {
  final singUpController = Get.put(SignUpController());
  var size;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height / 100 * 4,
                ),
                Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                _profilePic(),
                SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  "Name",
                  singUpController.nameController,
                  validator: (String? name) {
                    if (userName(name!))
                      return null;
                    else
                      return 'Enter your name';
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  "Email",
                  singUpController.emailController,
                  validator: (String? email) {
                    if (isEmailValid(email!))
                      return null;
                    else
                      return 'Enter a valid email address';
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  "Phone Number",
                  singUpController.numberController,
                  keyboardType: TextInputType.phone,
                  validator: (String? mobile) {
                    if (mobileNumber(mobile!))
                      return null;
                    else
                      return 'Enter a valid mobile number';
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  "Password",
                  singUpController.passwordController,
                  isObscure: true,
                  validator: (String? password) {
                    if (isPasswordValid(password!))
                      return null;
                    else
                      return 'Enter a valid password';
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                CommonButton(
                  buttonText: "Singup",
                  onTap: () {
                    if (formGlobalKey.currentState!.validate()) {
                      singUpController.addUserData();
                    }
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    children: [
                      TextSpan(
                        text: " Login",
                        style: TextStyle(
                            fontSize: 16, decoration: TextDecoration.underline),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profilePic() {
    return Container(
      height: size.height / 100 * 22,
      width: size.height / 100 * 22,
      child: Stack(
        children: [
         Obx(()=> singUpController.base64Image.isNotEmpty?Padding(
           padding: const EdgeInsets.all(16),
           child: CircleContainer(
             height: size.height / 100 * 18,
             child: Image.memory(base64Decode(singUpController.base64Image.value,),fit: BoxFit.fill),
             color: Colors.white,
           ),
         ):Padding(
           padding: const EdgeInsets.all(16),
           child: CircleContainer(
             height: size.height / 100 * 18,
             child: Image.asset("assets/placeImage.png",fit: BoxFit.fill,),
             color: Colors.white,
           ),
         )),
          Positioned(
              bottom: 12,
              right: 12,
              child: IconButton(
                color: Colors.blue,
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  singUpController.pickImageFromGallery();
                },
              ))
        ],
      ),
    );
  }
}
