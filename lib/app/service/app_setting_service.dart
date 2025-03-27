import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modal/setting/app_config.dart';
import 'package:flutter_getx_mobile_app/app/modal/setting/app_setting.dart';
import 'package:flutter_getx_mobile_app/app/service/app_storage_service.dart';
import 'package:flutter_getx_mobile_app/core/constants/storage_keys.dart';

class AppSettingService extends GetxService {
  late AppSetting appSetting;
  late AppConfig config;

  AppStorageService appStorageService = Get.find<AppStorageService>();

  AppSettingService() {
    Map<String, dynamic> data = Map<String, dynamic>.from(
        appStorageService.read<Map>(StorageKeys.settingBoxKey));
    appSetting = AppSetting.fromMap(data);
  }

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
    config = AppConfig.fromMap(dotenv.env);
  }

  void save() {
    appStorageService.write(StorageKeys.settingBoxKey, appSetting.toMap());
  }
}
