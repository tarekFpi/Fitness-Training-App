// ignore_for_file: prefer_const_constructors
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRowContainer extends StatelessWidget {
  final String name;
  final String title;
  final String image;

  const CustomRowContainer({
    super.key,
    required this.name,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.resourcesArticlesScreen);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.lightRed2,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      CustomText(
                        text: name,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: title,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.white,
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),

                ///================== Slider Image ==================
                Stack(
                  children: [
                    CustomNetworkImage(
                      imageUrl: image,
                      width: MediaQuery.sizeOf(context).width / 2.7,
                      height: MediaQuery.sizeOf(context).height / 7,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


