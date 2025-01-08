// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.time,
    this.isSend = false,
    this.isRead = false,
    this.myMessage = false,
    this.isActive = false, required this.onTap,

  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final String time;
  final bool isSend;
  final bool isRead;
  final bool myMessage;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CustomNetworkImage(
                        imageUrl: imageUrl,
                        height: 54.w,
                        width: 54.w,
                        boxShape: BoxShape.circle,
                      ),
                      isActive
                          ? Positioned(
                              bottom: 5.w,
                              right: 0,
                              child: Container(
                                height: 12.h,
                                width: 12.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightRed2,
                      ),
                      CustomText(
                        text: subtitle,
                        fontSize: 12.w,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white.withOpacity(.8),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: time,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_60.withOpacity(.5),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                   CustomImage(
                    imageSrc: AppIcons.kaclIcon,
                    imageColor: AppColors.black_60,
                    height: 12,
                    width: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          color: AppColors.black_60.withOpacity(.1),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
