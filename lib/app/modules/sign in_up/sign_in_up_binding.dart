import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/sign%20in_up/sign_in_up_controller.dart';

class SignInUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInUpController>(() => SignInUpController());
  }
}
