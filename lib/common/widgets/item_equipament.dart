import 'package:flutter/material.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class ItemEquipament extends StatelessWidget {
  final Equipament equipement;
  const ItemEquipament({super.key, required this.equipement});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(
            width: Helpers.screenWidth(context) * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(equipement.images[0], fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Text(
                equipement.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color:
                      AppDeviceUtils.isDarkMode() ? Colors.white : Colors.black,
                ),
              ),
              Text(
                "Perido: ${equipement.minDays} - ${equipement.maxDays} dias",
                style: TextStyle(
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
                        fontSize: 18,
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
    );
  }
}
