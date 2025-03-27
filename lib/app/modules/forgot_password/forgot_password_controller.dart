import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter_getx_mobile_app/app/modal/forgot_password/forgot_password.dart';
import 'package:flutter_getx_mobile_app/app/modules/base_controller.dart';

class ForgotPasswordController extends BaseController {
  List<ForgotPasswordData> forgotPasswordData = [
    ForgotPasswordData(
        title: "Forgot password?",
        content:
            "Enter your registered email below. We will send you an OTP to reset your password",
        type: ForgotPasswordType.forgot,
        buttonText: "Send OTP"),
    ForgotPasswordData(
        title: "Verify OTP",
        content: "Enter your 6 digits OTP sent to example123@cmail.com. Edit",
        type: ForgotPasswordType.verify,
        buttonText: "Verify OTP"),
    ForgotPasswordData(
        title: "Reset password",
        content:
            "Create a new strong password. New passwords must be different from old password.",
        type: ForgotPasswordType.reset,
        buttonText: "Change password"),
  ];
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxInt currentIndex = 0.obs;

  void goToNextPage() {
    if (currentIndex.value < forgotPasswordData.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
  }
}
