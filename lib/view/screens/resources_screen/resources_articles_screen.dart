// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/html_escape.dart';
import 'package:html/parser.dart';

class ResourcesArticlesScreen extends StatefulWidget {
    ResourcesArticlesScreen({super.key});

  @override
  State<ResourcesArticlesScreen> createState() => _ResourcesArticlesScreenState();
}

class _ResourcesArticlesScreenState extends State<ResourcesArticlesScreen> {

  var argumentData = Get.arguments;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(appBarContent: AppStrings.articles,showLeading: true,),

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// =============Strength Training ============
            CustomText(
             //  text: AppStrings.strangthTraining,
               text: "Title:${argumentData[0]["title"]}",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.lightRed2,
              bottom: 10.h,
            ),

           Row(
             children: [
               Icon(Icons.access_time_filled,color: AppColors.lightRed2,size: 15,),
               CustomText(
                 left: 10.w,
                 text: AppStrings.published,
                 fontSize: 14,
                 fontWeight: FontWeight.w300,
                 color: AppColors.white,
               ),
             ],
           ),
            SizedBox(height: 20.h,),
            ///========================== Ntrition Image ==============
            CustomNetworkImage(
                //imageUrl: AppConstants.sliderImage1,
                imageUrl: "${argumentData[0]["image"]}",
                height: 200.h,
                width: MediaQuery.sizeOf(context).width,
              borderRadius: BorderRadius.circular(20),
            ),

            SizedBox(height: 12.h,),
            ///=========== Plan Your Routine ===========
            CustomText(
              //text: AppStrings.planYourRoutine,
              text: "Topic:${argumentData[0]["topic"]}",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.lightRed2,
            ),

            /// =============Strength Training ============
            CustomText(
             // text: AppStrings.title1,
              text: "Description : ${parse(
                  '${argumentData[0]["description"]}').body?.text}",
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.white,
              bottom: 20.h,
              maxLines: 7,
              textAlign: TextAlign.start,
              top: 20.h,
            ),

        /*    ///============ Strength Training ============
            CustomText(
              text: AppStrings.title1,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.white,
              bottom: 10.h,
              maxLines: 7,
              textAlign: TextAlign.start,
              top: 10.h,
            ),
            ///=========== Plan Your Routine ===========
            CustomText(
              text: AppStrings.warmUp,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.lightRed2,
            ),
            ///============ Strength Training ============
            CustomText(
              text: AppStrings.title1,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.white,
              bottom: 10.h,
              maxLines: 7,
              textAlign: TextAlign.start,
              top: 10.h,
            ),*/

          ],
        ),
      ),
    );
  }
}
