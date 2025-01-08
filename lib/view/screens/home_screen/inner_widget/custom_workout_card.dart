import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWorkoutCard extends StatelessWidget {
  final Function()? onTap;
  final String imageSrc;
  final String title;
  final String subtitle;
  const CustomWorkoutCard(
      {super.key,
      this.onTap,
      required this.imageSrc,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector( 
          onTap: onTap,
          child: Column(
            children: [
              CustomNetworkImage(
                imageUrl: imageSrc,
                width: 100.w,
                height: 100.h,
                borderRadius: BorderRadius.circular(20),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 100.w,
                height: 22.h,
                decoration: BoxDecoration(
                  color: AppColors.grey_2,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                    child: CustomText(
                  text: title,
                  fontSize: 14.sp,
                  color: AppColors.yellow,
                )),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox( 
                width: 70.w,
                height: 50.h,
                child: CustomText(
                  text: subtitle,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  maxLines: 2,
                  textAlign: TextAlign.start, 
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }
}
