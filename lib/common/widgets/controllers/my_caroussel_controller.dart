import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCarouselController extends GetxController {
  static MyCarouselController get instance => Get.find();
  var currentPage = 0.obs;
  late PageController pageController;

  final RxList<dynamic> imageUrls = [].obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void jumpToPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
