import 'package:appentus_task/model/userModel.dart';
import 'package:appentus_task/screens/auth/login_screen.dart';
import 'package:get/get.dart';

import 'dbController.dart';

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(UserModel userModel) => _user.value = userModel;

  @override
  void onInit() {
    super.onInit();

    if (BoxDatabase.getData("isLoggedIn") ?? false) {
      setUserData();
    }
  }

  void setUserData() {
    user = UserModel.fromJson({
      "name": BoxDatabase.getData("name"),
      "email": BoxDatabase.getData("email"),
      "number": BoxDatabase.getData("number"),
      "image": BoxDatabase.getData("image"),
      "isLoggedIn": BoxDatabase.getData("isLoggedIn"),
    });
  }

  void logout() {
    Get.offAll(LoginScreen());
    logout();
  }
}
