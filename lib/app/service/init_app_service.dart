import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/service/app_api_service.dart';
import 'package:flutter_getx_mobile_app/app/service/app_setting_service.dart';
import 'package:flutter_getx_mobile_app/app/service/app_storage_service.dart';

Future<void> initAppService() async {
  //App storage service

  var appStorageService = AppStorageService();
  await appStorageService.init();

  Get.put<AppStorageService>(appStorageService);

  //App setting service

  var appSettingService = AppSettingService();
  await appSettingService.init();

  Get.put<AppSettingService>(appSettingService);

  //App API service

  var appAPIService = AppApiService();
  Get.put<AppApiService>(appAPIService);
}
