import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/features/client_ui/screens/cart/cart_screen.dart';
import 'package:project/features/client_ui/screens/home/home.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    CartScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.blue),
    Container(color: Colors.amber),
  ];
}
