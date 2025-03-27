import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mobile_app/app/modules/onboarding/walkthough_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_getx_mobile_app/core/constants/theme/app_icons.dart';

import '../../../widgets/generic_box.dart';

class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WalkThroughPage> createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  @override
  Widget build(BuildContext context) {
    final WalkThroughController controller = Get.find();

    return Obx(() {
      return Scaffold(
        body: (controller.currentIndex.value == 3)
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0.w, right: 20.0.w, top: 92.0.h, bottom: 35.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Welcome to Nasew',
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(
                          height: 92.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  controller
                                      .onboardingData[
                                          controller.currentIndex.value]
                                      .title,
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              SizedBox(
                                height: 10.h,
                              ),
                              Center(
                                  child: Text(
                                controller
                                    .onboardingData[
                                        controller.currentIndex.value]
                                    .content,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 0.1,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      controller
                          .onboardingData[controller.currentIndex.value].image,
                      height: 140.h, // adjust height as needed
                      width: MediaQuery.of(context)
                          .size
                          .width, // takes the whole width
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: GenericBox(
                      fillColor: Theme.of(context).primaryColor,
                      onTap: () {
                        Get.offNamed('/sign-in-up');
                      },
                      child: Center(
                        child: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  )
                ],
              )
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 52.0.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        controller.onboardingData[controller.currentIndex.value]
                            .image,
                        height: 522.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.0.w),
                      child: Column(
                        children: [
                          Text(
                              controller
                                  .onboardingData[controller.currentIndex.value]
                                  .title,
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                              controller
                                  .onboardingData[controller.currentIndex.value]
                                  .content,
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              controller.goToNextPage();
                            },
                            child: Text(
                              'Next',
                              style: Theme.of(context).textTheme.titleSmall,
                            )),
                        Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.offNamed('/sign-in-up');
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: AppIcons.skipIcon,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
      );
    });
  }
}
