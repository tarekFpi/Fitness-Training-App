// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_images/app_images.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/onboarding_screen/inner_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return  Scaffold(
        body:  Stack(clipBehavior: Clip.none,
          children: [
            CustomImage(
                imageSrc: AppImages.registrationImage,
                fit: BoxFit.fill,
                height: size.height,
                scale: 4,
                width: size.width),
            Positioned(
                bottom: 0,
                height: MediaQuery.sizeOf(context).height / 2.5,
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.onboardingCard.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.r),
                        topLeft: Radius.circular(50.r)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      InnerCustomText(
                        text: AppStrings.doWhatYouCan,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: AppColors.brinkPink,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        text: AppStrings.doWhatYouCanTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomButton(
                        onTap: () {
                          Get.toNamed(AppRoutes.goalListScreen);
                        },
                        title: AppStrings.next,
                        height: 44.h,
                        width: 210.w,
                        fillColor: Colors.transparent,
                        isBorder: true,
                        borderWidth: 1,textColor: AppColors.white,
                      )
                    ],
                  ),
                )),
          ],
        )
    );
  }
}