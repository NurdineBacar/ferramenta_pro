import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/features/admin_ui/screens/admin_bookers/admin_bookers.dart';
import 'package:project/features/admin_ui/screens/dash/dashboard_screen.dart';
import 'package:project/features/profile/profile_screen.dart';

class AdminNavigatorController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    DashboardScreen(),
    AdminBookersScreen(),
    Container(color: Colors.deepOrange),
    Container(color: Colors.blue),
    ProfileScreen(),
  ];
}
