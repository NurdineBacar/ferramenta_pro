import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/text_string.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.screenWidth(context),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 18),
            width: Helpers.screenWidth(context) * 0.60,
            child: Text(
              AppTextConst.bannerText,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(Iconsax.shop, size: 60, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
