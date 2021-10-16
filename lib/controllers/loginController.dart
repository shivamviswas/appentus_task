import 'package:appentus_task/controllers/dbController.dart';
import 'package:appentus_task/controllers/userController.dart';
import 'package:appentus_task/model/userModel.dart';
import 'package:appentus_task/screens/map/mapView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  onLoginEvent() async {
    print("ok");
    if (BoxDatabase.getData("email") != null) {

      if (BoxDatabase.getData("email") == emailController.text &&
          BoxDatabase.getData("password") == passwordController.text) {
        BoxDatabase.putData("isLoggedIn", true);
        setUserData();
        Get.offAll(MapScreen());
      } else {
        Get.snackbar("Error", "Invalid email or password",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Error", "No data available please create account first.",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
    ;
  }

  void setUserData() {
    Get.put(UserController()).user = UserModel.fromJson({
      "name": BoxDatabase.getData("name"),
      "email": BoxDatabase.getData("email"),
      "number": BoxDatabase.getData("number"),
      "image": BoxDatabase.getData("image"),
      "isLoggedIn": BoxDatabase.getData("isLoggedIn"),
    });
  }
}
