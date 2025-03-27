import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_getx_mobile_app/app/modules/email_authentication/email_authentication_page.dart';
import 'package:flutter_getx_mobile_app/app/modules/forgot_password/forgot_password_page.dart';
import 'package:flutter_getx_mobile_app/app/modules/sign%20in_up/sign_in_up_page.dart';

import '../app/modules/email_authentication/email_authentication_binding.dart';
import '../app/modules/forgot_password/forgot_password_binding.dart';
import '../app/modules/onboarding/walkthough_page.dart';
import '../app/modules/onboarding/walkthrough_binding.dart';
import '../app/modules/sign in_up/sign_in_up_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.WALKTHROUGH;

  static final routes = [
    GetPage(
      name: _Paths.WALKTHROUGH,
      page: () => const WalkThroughPage(),
      binding: WalkthroughBinding(),
    ),
    GetPage(
      name: _Paths.SIGNINUPPAGE,
      page: () => const SignInUpPage(),
      binding: SignInUpBinding(),
    ),
    GetPage(
      name: _Paths.EMAILAUTHENTICATIONPAGE,
      page: () => const EmailAuthenticationPage(),
      binding: EmailAuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORDPAGE,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
