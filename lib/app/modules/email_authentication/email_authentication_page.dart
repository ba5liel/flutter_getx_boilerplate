import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/email_authentication/email_authentication_controller.dart';
import '../../../core/constants/theme/app_icons.dart';
import '../../../widgets/generic_box.dart';

class EmailAuthenticationPage extends StatelessWidget {
  const EmailAuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailAuthenticationController controller = Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 88.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 32.h,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppIcons.selamBigIcon,
                SizedBox(
                  height: 30.h,
                ),
                Obx(() {
                  return Text(
                    controller.currentChoice.value == 'Sign in'
                        ? 'Sign in with Email'
                        : 'Sign up with Email',
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() {
                  return (controller.currentChoice.value == 'Sign in')
                      ? const SizedBox.shrink()
                      : GenericBox(
                          borderColor: Colors.black12,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              controller: controller.fullNameController,
                              decoration: const InputDecoration(
                                hintText: 'Full name',
                                border: InputBorder.none,
                              ),
                            ),
                          ));
                }),
                SizedBox(
                  height: 20.h,
                ),
                GenericBox(
                    borderColor: Colors.black12,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                GenericBox(
                    borderColor: Colors.black12,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 60.h,
                ),
                GenericBox(
                    fillColor: Theme.of(context).primaryColor,
                    child: Center(
                        child: Obx(
                      () => (controller.currentChoice.value == 'Sign in')
                          ? Text(
                              "Sign in",
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          : Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                    ))),
                Obx(() {
                  return (controller.currentChoice.value == 'Sign in')
                      ? Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forgot Password? ",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/forgot-password');
                                  },
                                  child: Text(
                                    "Reset",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "By Signing up you agree to our Terms of Service and Privacy Policy",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Colors.black26),
                              ),
                            ],
                          ),
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
