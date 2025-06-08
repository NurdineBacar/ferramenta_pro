import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/common/widgets/controllers/my_caroussel_controller.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/image.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CourosselItem extends StatelessWidget {
  final List<String> images;
  CourosselItem({super.key, required this.images});

  final controller = Get.put(MyCarouselController());

  @override
  Widget build(BuildContext context) {
    controller.imageUrls.value =
        images.isNotEmpty ? images : [AppImage.noImage];
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
