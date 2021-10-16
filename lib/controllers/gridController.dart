import 'package:appentus_task/model/ImageResponse.dart';
import 'package:appentus_task/utils/dataResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridController extends GetxController {
  RxBool isDataLoading = false.obs;
  RxBool nextPageDataLoading = false.obs;
  RxList<ImagesResponse> imageList = <ImagesResponse>[].obs;
  ScrollController scrollController = new ScrollController();
  int page=1;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getNextPageData(++page);
      }
    });
    _getData();
  }

  void _getData() async {
    isDataLoading.value = true;
    var dataResponse = await DataResponse.getImages();
    isDataLoading.value = false;
    if (dataResponse != "error") {
      imageList.value = List<ImagesResponse>.from(
          dataResponse.map((x) => ImagesResponse.fromJson(x)));
    } else {
      Get.snackbar("Error", "Something went wrong.",
          colorText: Colors.white, backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getNextPageData(page) async {
    nextPageDataLoading.value = true;
    var dataResponse = await DataResponse.getImages(page:page);
    Future.delayed(Duration(seconds: 2)).then((value) {
      nextPageDataLoading.value = false;
      if (dataResponse != "error") {
        imageList.addAll(List<ImagesResponse>.from(
            dataResponse.map((x) => ImagesResponse.fromJson(x))));
      } else {
        Get.snackbar("Error", "Something went wrong.",
            colorText: Colors.white, backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
