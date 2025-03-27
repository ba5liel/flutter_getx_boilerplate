import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/email_authentication/email_authentication_controller.dart';

class EmailAuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailAuthenticationController>(
        () => EmailAuthenticationController());
  }
}
