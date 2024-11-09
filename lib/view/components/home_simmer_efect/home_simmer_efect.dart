import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey_2,
      highlightColor: AppColors.grey_1,
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Container(
            height: 20.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.grey_1,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 30.h),

          /// Simulated Row of Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              return Column(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey_1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 60.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey_1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 20.h),

          /// Simulated Large Card
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 5,
            decoration: BoxDecoration(
              color: AppColors.grey_1,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 20.h),

          /// Simulated Workout Section
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 80.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.grey_1,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          /// Simulated Horizontal Scrolling Workouts
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(6, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey_1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 100.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey_1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20.h),

          /// Simulated Nutrition Section
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 80.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.grey_1,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          /// Simulated Horizontal Scrolling Nutrition Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(6, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey_1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 100.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey_1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
