import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CourosselItem extends StatelessWidget {
  CourosselItem({super.key});

  final controller = Get.put(CarouselController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Helpers.size(context).height * 0.42,
      width: Helpers.screenWidth(context),
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.imageUrls.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (_, index) {
              final image = controller.imageUrls[index];

              return Image.asset(image, fit: BoxFit.cover);
            },
          ),

          Positioned(
            bottom: 20,
            left: Helpers.screenWidth(context) * 0.39,
            child: // Dots indicadores (pode trocar por thumbnails também)
                Obx(
              () => Row(
                children: List.generate(controller.imageUrls.length, (index) {
                  return GestureDetector(
                    onTap: () => controller.jumpToPage(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentPage.value == index ? 12 : 8,
                      height: controller.currentPage.value == index ? 12 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            controller.currentPage.value == index
                                ? AppColors.primary
                                : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;

  final List<String> imageUrls = [
    'assets/images/ite.jpeg',
    'assets/images/ite-2.jpeg',
    'assets/images/ite-3.jpeg',
    'assets/images/ite-4.jpeg',
  ];

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
