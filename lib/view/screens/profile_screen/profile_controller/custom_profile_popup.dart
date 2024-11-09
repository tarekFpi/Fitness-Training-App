// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfilePopup extends StatelessWidget {
  final String imageSrc;
  final String name;
  final String? title;
  final String buttonText;
  final String? cancelButton;
  final void Function()? onTap;
  const CustomProfilePopup(
      {super.key,
        required this.imageSrc,
        required this.name,
        this.title,
        required this.buttonText,
        this.cancelButton, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
        ),
        CustomImage(imageSrc: imageSrc,height: 50.h,width: 50.w,),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          text: name,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
          maxLines: 2,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          text: title ?? "",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.grey_1,
          maxLines: 4,
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomButton(
          onTap: onTap?? (){},
          title: buttonText,
          borderRadius: 4,
          fillColor: AppColors.lightRed2,
        ),
        SizedBox(
          height: 10.h,
        ),
         CustomButton(onTap: (){
          Navigator.pop(context);
        },
          title: cancelButton?? "",
          borderRadius: 4,
          isBorder: true,
          fillColor: AppColors.white,
          textColor: AppColors.grey_1,
        )
      ],
    );
  }
}
