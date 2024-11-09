// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArticleContainer extends StatelessWidget {
  final String name;
  final String minutes;
  final String kcal;
  final String exercise;
  final String image;

  const CustomArticleContainer({
    super.key,
    required this.name,
    required this.minutes,
    required this.kcal,
    required this.exercise,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 6,
            decoration: BoxDecoration(
              color: AppColors.lightRed2,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ///=================== image =================
                  CustomNetworkImage(
                    imageUrl: image,
                    width: MediaQuery.sizeOf(context).width / 2.7,
                    height: MediaQuery.sizeOf(context).height / 5,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  SizedBox(width: 20.w),

                  ///=================== Article Details =================
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppStrings.loseFat,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        CustomText(
                          text: AppStrings.loseFattitle,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.black,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              height: 30.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: CustomText(
                  text: AppStrings.seconds,
                  color: AppColors.black,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

