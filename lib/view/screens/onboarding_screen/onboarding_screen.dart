// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/onboarding_screen/content_model/content_model.dart';
import 'package:fitness_training_app/view/screens/onboarding_screen/inner_widget/custom_text.dart';
import 'package:fitness_training_app/view/screens/onboarding_screen/onboarding_controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_image/custom_image.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController onboardingController =Get.find<OnboardingController>();
   OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return  Scaffold(
        body: Obx((){
          return Stack(clipBehavior: Clip.none,
            children: [
              CustomImage(
                  imageSrc: contents[onboardingController.currentIndex.value].image,
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
                      color: AppColors.onboardingCard.withOpacity(0.8),
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
                          text: contents[onboardingController.currentIndex.value].name,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightRed2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: contents[onboardingController.currentIndex.value].title,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                          maxLines: 5,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                                  (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomButton(
                          onTap: () {
                            if(onboardingController.currentIndex.value<2){
                              onboardingController.currentIndex.value=onboardingController.currentIndex.value+1;
                            }else{
                              Get.offAllNamed(AppRoutes.signInScreen);
                            }
                          },
                          title: onboardingController.currentIndex.value >= 2
                              ? 'Get Started'
                              : AppStrings.next,
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
          );
        })
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: onboardingController.currentIndex.value == index ? 35 : 35,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: onboardingController.currentIndex.value== index ? AppColors.brinkPink : AppColors.white,

      ),
    );
  }
}

