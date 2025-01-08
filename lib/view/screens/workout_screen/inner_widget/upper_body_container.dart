// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpperBodyContainer extends StatelessWidget {
  final String name;
  final String minutes;
  final String kcal;
  final String exercise;
  final String image;
  final String work_id;


    UpperBodyContainer(
      {super.key,
        required this.name,
        required this.minutes,
        required this.kcal,
        required this.exercise,
        required this.image,
        required this.work_id
      });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 6.5,
        decoration: BoxDecoration(
          color: AppColors.grey_3,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 200,
                    child: CustomText(
                      text: name,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///===================Time=================
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_sharp,
                              color: AppColors.black,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomText(
                              text: minutes,
                              color: AppColors.black,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                    
                        ///=================Kcal================
                        Row(
                          children: [
                            Icon(
                              Icons.keyboard_command_key_rounded,
                              color: AppColors.black,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              width: 50,
                              child: CustomText(
                                text: kcal,
                                color: AppColors.black,
                                fontSize: 14.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  ///=================Kcal================
                  Flexible(
                    child: Row(
                      children: [
                        Icon(
                          Icons.extension,
                          color: AppColors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                          text: exercise,
                          color: AppColors.black,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  )
                ],
              ),

              ///================== Slider Image ==================
              Flexible(
                child: Stack(
                  children: [
                    CustomNetworkImage(
                      imageUrl: image,
                      width: MediaQuery.sizeOf(context).width / 2.7,
                      height: MediaQuery.sizeOf(context).height / 5,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                   /* Positioned(
                      top: 0,
                      right: 10,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
