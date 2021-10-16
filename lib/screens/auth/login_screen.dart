import 'package:appentus_task/controllers/loginController.dart';
import 'package:appentus_task/screens/auth/signup_screen.dart';
import 'package:appentus_task/utils/inputValidation.dart';
import 'package:appentus_task/widgets/commonButton.dart';
import 'package:appentus_task/widgets/commonTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget with InputValidationMixin {
  final loginController = Get.put(LoginController());
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  height: size.height / 100 * 16,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  "Email",
                  loginController.emailController,
                  validator: (String ?email) {
                    if (!isEmailValid(email!)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  "Password",
                  loginController.passwordController,
                  validator: (password) {
                    if (!isPasswordValid(password!)) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                  isObscure: true,
                ),
                SizedBox(
                  height: 26,
                ),
                CommonButton(
                  buttonText: "Login",
                  onTap: () {

                    if (formGlobalKey.currentState!.validate()) {

                      loginController. onLoginEvent();
                    }else{
                      return;
                    }
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                RichText(
                  text: TextSpan(
                    text: "Haven't any account",
                    children: [
                      TextSpan(
                        text: " Sign up",
                        style: TextStyle(
                            fontSize: 16, decoration: TextDecoration.underline),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Get.to(()=>SignUpScreen()),
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
}
