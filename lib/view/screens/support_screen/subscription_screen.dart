// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/support_screen/inner_widget/custom_subscription_container.dart';
import 'package:fitness_training_app/view/screens/support_screen/subscription_controller/SubscriptionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';


class SubscriptionScreen extends StatefulWidget {
  SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  final SubscriptionController subscriptionController = Get.find<SubscriptionController>();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.subscription),
      body: Obx(
         () {
          return Padding(padding: EdgeInsets.only(left: 12, right: 12,top: 120.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColors.lightRed2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: AppStrings.chooseYourSubscriptionPlan,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      bottom: 30.h,
                    ),


                 SizedBox(
                   height: MediaQuery.sizeOf(context).height / 2.6,
                   child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: subscriptionController.subscriptionShow.length,
                      itemBuilder: (BuildContext context, int index) {

                        final model = subscriptionController.subscriptionShow[index];

                        return Container(
                          margin: EdgeInsets.only(left: 8),
                           height:MediaQuery.sizeOf(context).height / 3,
                           width: 160,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              CustomText(
                                top: 20.h,
                                text: " ${model.title}",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.lightRed2,
                              ),

                              Container(
                                height: 1.h,
                                width: 60.w,
                                color: AppColors.lightRed2,
                              ),

                              ///===================== Doer =================
                              CustomText(
                                top: 10.h,
                                text: "\$ ${model.price}",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),

                              ///==================== Doer Title =================
                              for(int i = 0; i <model.accessItems!.length; i++)
                                CustomText(
                                  top: 10.h,
                                  text: "${model.accessItems?[i]}",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                  textAlign: TextAlign.center,
                                ),

                              SizedBox(
                                height: 10.h,
                              ),

                              ///==================== Get Started Button =================

                              Flexible(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: CustomButton(
                                      onTap: () {

                                    ///  Get.offAllNamed(AppRoutes.homeScreen);
                                        ///
                                     subscriptionController.makePayment(model.price.toString(),model.id.toString());
                                      },
                                      title: AppStrings.getStarted,
                                      height: 35.h,
                                      width: 100.w,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                )
              )
            ],
          ),);
        }
      )
    );

  }
}
