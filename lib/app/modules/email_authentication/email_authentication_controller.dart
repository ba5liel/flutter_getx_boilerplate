import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/base_controller.dart';

class EmailAuthenticationController extends BaseController {
  RxString currentChoice = "Sign up".obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final String arguments = Get.arguments.toString();
    currentChoice.value = arguments;
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
