import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/service/init_app_service.dart';
import 'package:flutter_getx_mobile_app/routes/app_pages.dart';
import 'core/constants/theme/app_theme.dart';

void main() async {
  await initAppService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppTheme.appTheme,
      ),
    );
  }
}
