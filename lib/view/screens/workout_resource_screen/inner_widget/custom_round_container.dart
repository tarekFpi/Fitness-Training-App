import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutVidoeResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
class CustomRoundContainer extends StatefulWidget {

  final WorkoutVidoeResponse workListSingleList;

    CustomRoundContainer({super.key,required this.workListSingleList});

  @override
  State<CustomRoundContainer> createState() => _CustomRoundContainerState();
}

class _CustomRoundContainerState extends State<CustomRoundContainer> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: (){

          Get.toNamed(AppRoutes.workoutResourceVideoPlayScreen,arguments: [
            {
              "videoUrl":widget.workListSingleList.video,
              "uid":widget.workListSingleList.id,
            },
          ]);

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          //height: 80.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  CustomNetworkImage(
                    imageUrl: AppConstants.girlsPhoto,
                    // imageUrl: "${ApiUrl.imageUrl}${widget.workListSingleList.video}",
                    height: 80.h,
                    width: 80.w,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  Positioned(
                      top: 30.h,
                      left: 30.w,
                      child: CustomImage(
                        imageSrc: AppIcons.playvideo,
                        height: 30.h,
                        width: 30.w,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                   //   crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 140.h,
                          child: CustomText(
                           // text: AppStrings.dumbbellRows,
                            text: "${widget.workListSingleList.title}",
                            color: AppColors.lightRed2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip
                          ),
                        ),

                        SizedBox(width: 16.w,),

                        Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            //text: AppStrings.repititon,
                             text: AppStrings.repititon+"${widget.workListSingleList.rep}",
                            color: AppColors.lightRed2,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                           overflow: TextOverflow.clip
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled,color: AppColors.lightRed2,size: 15.sp,),
                        CustomText(
                          //text: AppStrings.seconds,
                          text: "${DateConverter.convertTimeToMinutes(widget.workListSingleList.duration.toString())}",
                          color: AppColors.lightRed2,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
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
