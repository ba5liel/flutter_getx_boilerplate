import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/sign%20in_up/sign_in_up_controller.dart';

import '../../../core/constants/theme/app_icons.dart';
import '../../../widgets/generic_box.dart';

class SignInUpPage extends StatelessWidget {
  const SignInUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInUpController controller = Get.find();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 92.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIcons.selamSmallIcon,
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Welcome to Nasew',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 50.h,
            ),
            GenericBox(
              borderColor: Colors.black54,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcons.googleIcon,
                    Obx(
                      () => (controller.currentChoice.value == 'Sign in')
                          ? Text(
                              'Sign in with Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                            )
                          : Text(
                              'Sign up with Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                            ),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GenericBox(
              borderColor: Colors.black54,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcons.facebookIcon,
                    Obx(
                      () => (controller.currentChoice.value == 'Sign in')
                          ? Text(
                              'Sign in with Facebook',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                            )
                          : Text(
                              'Sign up with Facebook',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                            ),
                    ),
                    SizedBox()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GenericBox(
              borderColor: Colors.black54,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcons.appleIcon,
                    Obx(
                      () => (controller.currentChoice.value == 'Sign in')
                          ? Text(
                              'Sign in with Apple',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                            )
                          : Text(
                              'Sign up with Apple',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                            ),
                    ),
                    SizedBox()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GenericBox(
              onTap: () {
                Get.toNamed('/email-authentication',
                    arguments: controller.currentChoice.value);
              },
              fillColor: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppIcons.emailIcon,
                    Text(
                      'Continue with email',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 68.h,
            ),
            Obx(() => (controller.currentChoice.value == 'Sign up')
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already registered? ",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.currentChoice.value = 'Sign in';
                        },
                        child: Text(
                          "Sign in",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not registered? ",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.currentChoice.value = 'Sign up';
                        },
                        child: Text(
                          "Sign up",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
