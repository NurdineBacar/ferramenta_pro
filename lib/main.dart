import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('myStorage');
  runApp(App());
}
