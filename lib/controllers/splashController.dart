import 'package:appentus_task/model/userModel.dart';
import 'package:appentus_task/screens/auth/login_screen.dart';
import 'package:appentus_task/screens/map/mapView.dart';
import 'package:get/get.dart';

import 'dbController.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (BoxDatabase.getData("isLoggedIn") ?? false) {
        Get.offAll(MapScreen());
      }else{
        Get.offAll(LoginScreen());
      }
    });
  }



}
