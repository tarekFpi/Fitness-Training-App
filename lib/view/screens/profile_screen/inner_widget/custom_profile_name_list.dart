// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileNameList extends StatelessWidget {
  final Function()? onTap;
  final String imageSrc;
  final String text;
  const CustomProfileNameList({
    super.key,
    this.onTap,
    required this.imageSrc,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 8, top: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomImage(imageSrc: imageSrc, height: 20.w, width: 20.w,imageColor: AppColors.lightRed2,),
                SizedBox(
                  width: 20.w,
                ),
                CustomText(
                    text: text,
                    fontSize: 18.w,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white),
              ],
            ),
            Icon(
              Icons.arrow_right,
              size: 20,
              color: AppColors.lightRed2,
            )
          ],
        ),
      ),
    );
  }
}
