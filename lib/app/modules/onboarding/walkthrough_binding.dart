import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/onboarding/walkthough_controller.dart';

class WalkthroughBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalkThroughController>(() => WalkThroughController());
  }
}
