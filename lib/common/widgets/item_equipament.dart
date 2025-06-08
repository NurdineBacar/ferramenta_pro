import 'package:flutter/material.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/utils/constants/image.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class ItemEquipament extends StatelessWidget {
  final EpiModel equipement;
  final VoidCallback? onAction;
  const ItemEquipament({super.key, required this.equipement, this.onAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAction,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Helpers.screenWidth(context) * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    equipement.images.isNotEmpty
                        ? Image.asset(equipement.images[0], fit: BoxFit.cover)
                        : Image.asset(AppImage.noImage, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Text(
                  equipement.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color:
                        AppDeviceUtils.isDarkMode()
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                Text(
                  "Perido: ${equipement.minDays} - ${equipement.maxDays} dias",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        AppDeviceUtils.isDarkMode()
                            ? Colors.grey[400]
                            : Colors.grey[600],
                  ),
                  textAlign: TextAlign.left,
                ),
                Text.rich(
                  TextSpan(
                    text: "Por dia: ",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          AppDeviceUtils.isDarkMode()
                              ? Colors.white
                              : Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "${equipement.pricePerDay} MT",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
