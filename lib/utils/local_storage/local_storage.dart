import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static final StorageUtils _instance = StorageUtils._internal();

  factory StorageUtils() {
    return _instance;
  }

  StorageUtils._internal();

  final _storage = GetStorage('myStorage');

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Adicionar verificação de tipo
  T? readData<T>(String key) {
    final data = _storage.read(key);
    return data is T ? data : null;
  }

  // Generic method to remove data
  Future<void> removedata<T>(String key) async {
    await _storage.remove(key);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _storage.erase();
  }

  Map<String, dynamic> dadosUser() {
    final Map<String, dynamic> userData = readData("user_data");
    return userData;
  }
}
