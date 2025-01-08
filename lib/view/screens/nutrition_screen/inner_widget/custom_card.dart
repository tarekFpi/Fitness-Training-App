// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 100.w,
        child: Column(
          children: [
            ///========================== Ntrition Image ==============
            CustomNetworkImage(
              imageUrl: AppConstants.ntrition,
              height: 100.h,
              width: 100.w,
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(
              height: 4.h,
            ),
            ///================== Title Name ==================
            CustomText(
              text: AppStrings.avocadoToastWithEgg,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.yellow,
              maxLines: 2,
              //textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                ///================= Time Icon =================
                Icon(
                  Icons.access_time_filled_sharp,
                  size: 10.h,
                  color: AppColors.purple,
                ),
                SizedBox(
                  width: 5.w,
                ),
                ///================= Mins Text =================
                CustomText(
                  text: AppStrings.mins,
                  fontSize: 8,
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(
                  width: 4.w,
                ),

                ///================= Kcal Icon =================
                CustomImage(
                  imageSrc: AppIcons.kaclIcon,
                  height: 10.h,
                  width: 10.w,
                  imageColor: AppColors.purple,
                ),
                SizedBox(
                  width: 5.w,
                ),
                ///================= cal Text =================
                CustomText(
                  text: AppStrings.cal,
                  fontSize: 8,
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
