import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class AppStorageService extends GetxService {
  late Box _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('nasew');
  }

  void write(String key, dynamic value) {
    _box.put(key, value);
  }

  T read<T>(String key) {
    return _box.get(key) as T;
  }
}
