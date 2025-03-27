import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modal/forgot_password/forgot_password.dart';
import 'package:flutter_getx_mobile_app/app/modules/forgot_password/forgot_password_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/utils/generic_dialog.dart';
import '../../../widgets/generic_box.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
          child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 88.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 32.h,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
              SizedBox(
                height: 120.h,
              ),
              Obx(() {
                return Text(
                    controller.forgotPasswordData[controller.currentIndex.value]
                        .title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ));
              }),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                return Text(
                    controller.forgotPasswordData[controller.currentIndex.value]
                        .content,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ));
              }),
              SizedBox(
                height: 60.h,
              ),
              Obx(() {
                if (controller.forgotPasswordData[controller.currentIndex.value]
                        .type ==
                    ForgotPasswordType.forgot) {
                  return GenericBox(
                      borderColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ));
                } else if (controller
                        .forgotPasswordData[controller.currentIndex.value]
                        .type ==
                    ForgotPasswordType.verify) {
                  return Column(
                    children: [
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        // length of the OTP
                        obscureText: false,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        controller: controller.otpController,
                        onCompleted: (v) {
                          print("Completed: $v");
                        },
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Text('00:30',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.white,
                                  )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive the OTP? ",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.currentIndex.value = 0;
                            },
                            child: Text(
                              "Resend",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      GenericBox(
                          borderColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              controller: controller.newPasswordController,
                              decoration: const InputDecoration(
                                hintText: 'Enter new password',
                                border: InputBorder.none,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      GenericBox(
                          borderColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              controller: controller.confirmPasswordController,
                              decoration: const InputDecoration(
                                hintText: 'Confirm new password',
                                border: InputBorder.none,
                              ),
                            ),
                          ))
                    ],
                  );
                }
              }),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: GenericBox(
                    onTap: () {
                      if (controller.currentIndex.value == 2) {
                        showGenericDialog<bool>(
                          icon: Icons.check_circle,
                          context: context,
                          title: "Password Changed Successfully",
                          dialogColor: Theme.of(context).backgroundColor,
                          optionsBuilder: () => {
                            'Okay': true,
                          },
                          selectedOption: 'Okay',
                        );
                      }
                      controller.goToNextPage();
                    },
                    fillColor: Colors.black,
                    child: Center(child: Obx(() {
                      return Text(
                        controller
                            .forgotPasswordData[controller.currentIndex.value]
                            .buttonText,
                        style: Theme.of(context).textTheme.labelLarge,
                      );
                    }))),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
