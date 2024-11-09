// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
import 'package:dotted_border/dotted_border.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImagePopup extends StatelessWidget {
  final String imageSrc;
  final String name;
  final String? title;
  final String buttonText;
  final String? cancelButton;
  final void Function()? onTap;
  const CustomImagePopup(
      {super.key,
      required this.imageSrc,
      required this.name,
      this.title,
      required this.buttonText,
      this.cancelButton,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.uploadYourRecipeImage,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: CustomImage(
                  imageSrc: AppIcons.cross,
                  height: 28.h,
                  width: 28.w,
                ))
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        DottedBorder(
          color: AppColors.lightRed2,
          padding: EdgeInsets.all(5),
          strokeWidth: 2,
          dashPattern: [5, 3],
          radius: Radius.circular(10),
          borderType: BorderType.RRect,
          child: Container(
            height: 120.h,
            width: 90.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_a_photo_outlined,
                  color: AppColors.lightRed2,
                  size: 30,
                ),
                CustomText(
                  top: 10.h,
                  text: AppStrings.camera,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                )
              ],
            ),
          ),
        ),
        ///==================== Upload Image ==============
        CustomText(
          top: 20.h,
          text: AppStrings.uploadImage,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        SizedBox(height: 20.h),
        CustomButton(
          onTap: onTap ?? () {},
          title: "Browse Gallery",
          borderRadius: 10,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
