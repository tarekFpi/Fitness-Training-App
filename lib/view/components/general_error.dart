import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors/app_colors.dart';

class GeneralErrorScreen extends StatelessWidget {
  const GeneralErrorScreen(
      {super.key, required this.onTap, required this.status});
  final Status status;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const CustomImage(imageSrc: AppImages.noInternetImage),
        SizedBox(
          height: 400.h,
        ),
      status == Status.internetError?  Text(
          "No Internet Connection",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Colors.white),
        ):Text(
          "Something wrong",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: Colors.white),
        ),
        SizedBox(
          height: 10.h,
        ),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.brinkPink,
            minimumSize: Size(Get.width / 1.6, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.r),
              ),
            ),
          ),
          child: Text(
            "Try Again",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
