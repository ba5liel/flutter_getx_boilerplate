import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter_getx_mobile_app/app/modal/onboarding/onboarding.dart';
import 'package:flutter_getx_mobile_app/app/modules/base_controller.dart';
import 'package:flutter_getx_mobile_app/core/constants/theme/app_images.dart';

class WalkThroughController extends BaseController {
  List<OnboardingData> onboardingData = [
    OnboardingData(
        title: "Discover amazing content",
        content:
            "Discover a world of diverse content. Explore categories, find top creators, and get personalized recommendations based on your interests.",
        image: AppImageRoute.walkthrough1),
    OnboardingData(
        title: "Stay connected with subscriptions",
        content:
            "Subscribe to your favorite creators to stay updated with their latest content.",
        image: AppImageRoute.walkthrough2),
    OnboardingData(
        title: "Engage and interact",
        content:
            "Like, comment, and interact with creators and other users. Join the conversations, express your thoughts, and be a part of the community.",
        image: AppImageRoute.walkthrough3),
    OnboardingData(
        title: "Discover amazing content",
        content: "Let’s find people to follow based on your interest",
        image: AppImageRoute.walkthrough1)
  ];

  RxInt currentIndex = 0.obs;

  void goToNextPage() {
    if (currentIndex.value < onboardingData.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
  }
}
