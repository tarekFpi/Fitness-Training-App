// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowContainer extends StatelessWidget {

    CustomRowContainer(this.ingredientList, {super.key});

    final SDatum ingredientList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        height: 65.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.amber,
          borderRadius:
          BorderRadius.all(Radius.circular(7)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomNetworkImage(
                    borderRadius: BorderRadius.circular(7),
                    //imageUrl: AppConstants.ntrition1,
                    imageUrl: "${ingredientList.img}",
                    height: 65.h,
                    width: 65.w),
                  SizedBox(
                    width: 10.w,
                  ),
                CustomText(
                  // text: "Avocado",
                   text: "${ingredientList.title}",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ],
            ),
            CustomText(
              right: 20.h,
              text: "¼",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
