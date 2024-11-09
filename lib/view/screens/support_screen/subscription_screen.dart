// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/support_screen/inner_widget/custom_subscription_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.subscription),
      body: Padding(padding: EdgeInsets.only(left: 20, right: 20,top: 120.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2.5,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.lightRed2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: AppStrings.chooseYourSubscriptionPlan,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  bottom: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  CustomSubscriptionContainer(
                    onTap: (){},
                    name: AppStrings.basic,
                    doller: AppStrings.doler,
                    dollerTitle: AppStrings.dolerTitle,),
                  CustomSubscriptionContainer(
                    onTap: (){},
                    name: AppStrings.basic,
                    doller: AppStrings.doler,
                    dollerTitle: AppStrings.dolerTitle,)
                ],)

              ],
            )
          )
        ],
      ),)
    );
  }
}
