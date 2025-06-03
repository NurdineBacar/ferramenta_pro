import 'package:get/get.dart';
import 'package:project/features/client_ui/screens/bookers/booker_screen.dart';
import 'package:project/features/client_ui/screens/cart/cart_screen.dart';
import 'package:project/features/client_ui/screens/favorites/favorite_screen.dart';
import 'package:project/features/client_ui/screens/home/home.dart';
import 'package:project/features/client_ui/screens/profile/profile_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    CartScreen(),
    BookerScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
}
