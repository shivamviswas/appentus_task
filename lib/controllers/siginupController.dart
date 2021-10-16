


import 'dart:convert';
import 'dart:io';

import 'package:appentus_task/controllers/userController.dart';
import 'package:appentus_task/model/userModel.dart';
import 'package:appentus_task/screens/map/mapView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'dbController.dart';

class SignUpController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  RxString base64Image = "".obs;

  final ImagePicker _picker = ImagePicker();
  // Pick an image

  pickImageFromGallery()async{
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      base64Image.value=base64Encode(File(pickedImage.path).readAsBytesSync());
    }
  }

  addUserData(){
    BoxDatabase.putData("name", nameController.text);
    BoxDatabase.putData("email", emailController.text);
    BoxDatabase.putData("number", numberController.text);
    BoxDatabase.putData("image", base64Image.toString());
    BoxDatabase.putData("isLoggedIn", true);

    Get.put(UserController()).user = UserModel.fromJson({
      "name": BoxDatabase.getData("name"),
      "email": BoxDatabase.getData("email"),
      "number": BoxDatabase.getData("number"),
      "image": BoxDatabase.getData("image"),
      "isLoggedIn": BoxDatabase.getData("isLoggedIn"),
    });
    Get.offAll(MapScreen());
  }



}