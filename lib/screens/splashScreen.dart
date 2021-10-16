

import 'package:appentus_task/controllers/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {

  final spController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.asset("assets/ftl.png"),
      ),
    );
  }
}
