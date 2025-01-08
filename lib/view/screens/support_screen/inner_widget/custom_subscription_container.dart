import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubscriptionContainer extends StatelessWidget {
  final String name;
  final String doller;
  final List<String>? dollerTitle;
  final void Function() onTap;
  const CustomSubscriptionContainer(
      {super.key,
      required this.name,
      required this.doller,
      required this.dollerTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 4.2,
      width: MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CustomText(
            top: 20.h,
            text: name,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.lightRed2,
          ),
          Container(
            height: 1.h,
            width: 60.w,
            color: AppColors.lightRed2,
          ),

          ///===================== Doler =================
          CustomText(
            top: 10.h,
            text: doller,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),

          ///==================== Doler Title =================
          CustomText(
            top: 10.h,
            text: "${dollerTitle?[0]}",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),

          CustomText(
            top: 10.h,
            text: "${dollerTitle?[1]}",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),

          ///==================== Get Started Button =================
          CustomButton(
            onTap: onTap,
            title: AppStrings.getStarted,
            height: 35.h,
            width: 100.w,
            fontSize: 10,
          )
        ],
      ),
    );
  }
}
