// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class CustomAppBarTitle extends StatelessWidget implements PreferredSizeWidget{
    CustomAppBarTitle({super.key});

    final EditProfileController editProfileController = Get.find<EditProfileController>();

    
  @override
  Widget build(BuildContext context) {
    
    return AppBar(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      actions: [

        IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchScreen);
            },
            icon: CustomImage(
              imageSrc: AppIcons.search,
              imageColor: AppColors.lightRed,
              height: 25.h,
              width: 25.h,
            )),
        IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.notificationScreen);
            },
            icon: CustomImage(
              imageSrc: AppIcons.ball,
              imageColor: AppColors.lightRed,
              height: 25.h,
              width: 25.h,
            )),
        IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.profileScreen);
            },
            icon: CustomImage(
              imageSrc: AppIcons.person,
              imageColor: AppColors.lightRed,
              height: 25.h,
              width: 25.h,
            )),
        SizedBox(
          width: 10.w,
        ),
      ],
      title: Obx(()=>CustomText(
        //text: AppStrings.name,
          text:"Hi ! ${editProfileController.userProfileShow.value.name}",
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.white)),
    );
  }

  @override
  // TO DO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
