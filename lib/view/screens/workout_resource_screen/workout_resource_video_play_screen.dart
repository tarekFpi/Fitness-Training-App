// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_images/app_images.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

class WorkoutResourceVideoPlayScreen extends StatefulWidget {
  const WorkoutResourceVideoPlayScreen({super.key});

  @override
  State<WorkoutResourceVideoPlayScreen> createState() =>
      _WorkoutResourceVideoPlayScreenState();
}

class _WorkoutResourceVideoPlayScreenState
    extends State<WorkoutResourceVideoPlayScreen> {

  late FlickManager flickManager;

  var argumentData = Get.arguments;

  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
      // ignore: deprecated_member_use
      videoPlayerController: VideoPlayerController.network(
       // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", video_url
        "${ApiUrl.vidoeUrl}${argumentData[0]["video_url"]}",

      ),
    );

  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.workoutVideos),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 8.0,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.white, width: 1.w),
              ),
              child: ClipRRect( 
                  borderRadius: BorderRadius.circular(5),
                  child: AspectRatio( 
                    aspectRatio: 16 / 15.5,
                    
                    child: FlickVideoPlayer(flickManager: flickManager))),
            ),
        
           Expanded(
             child: ListView(
              children: [
                 SizedBox(
                height: 20.h,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 3,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.r1, AppColors.r2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomText(
                      text: AppStrings.dumbbellRows,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///=================== Set=======
                        Container(
                          height: 90.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.white, width: 1.w),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Set : 2",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                              CustomText(
                                text: "Rep : 5",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                              CustomText(
                                text: "Duration : 45 Min",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                     
                        ///=================== Set=======
                        Container(
                          height: 90.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.white, width: 1.w),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Muscie Group",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomImage(imageSrc: AppImages.gymImage),
                                  CustomImage(imageSrc: AppImages.gymImage2),
                                ],
                              ),
                              CustomText(
                                text: "Hand Muscle Chest Muscle",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                     
                    ///=================== Set=======
                    Container(
                      height: 90.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.white, width: 1.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Equipement",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          CustomImage(imageSrc: AppImages.gymImage3),
                          CustomText(
                            text: "Dumbbell",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
                     
              ///=================== Button=======
             
              SizedBox(
                height: 50.h,
              ),
              ],
             ),
           )
          ],
        ),
      ), 
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(20.0.w),
        child: SizedBox(child: Obx(()=>
        homeController.workOutCreateLoading.value?CustomLoader(): CustomButton(
              width: 200.w,
              height: 45.h,
              onTap: () {
                homeController.createWorkOutVidoe("${argumentData[0]["u_id"]}");
              },
              title: AppStrings.complete,
              textColor: AppColors.black,
              fillColor: AppColors.lightRed2,
            )),),
      ),
    );
  }
}
  // Stack(
  //               children: [
  //                 CustomNetworkImage(
  //                   imageUrl: AppConstants.girlsPhoto2,
  //                   height: MediaQuery.sizeOf(context).height / 1.8,
  //                   width: MediaQuery.sizeOf(context).width,
  //                   borderRadius: BorderRadius.circular(20),
  //                   border: Border.all(color: AppColors.lightRed2, width: 2.w),
  //                 ),
  //                 Positioned(
  //                   left: 0,
  //                   right: 0,
  //                   bottom: 20,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       IconButton(
  //                           onPressed: () {},
  //                           icon: Icon(
  //                             Icons.arrow_back_ios,
  //                             color: AppColors.white,
  //                           )),
  //                       Container(
  //                         height: 60.h,
  //                         width: 60.w,
  //                         decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             color: AppColors.lightRed2),
  //                         child: Icon(
  //                           Icons.play_arrow,
  //                           color: AppColors.white,
  //                           size: 40.sp,
  //                         ),
  //                       ),
  //                       IconButton(
  //                           onPressed: () {},
  //                           icon: Icon(
  //                             Icons.arrow_forward_ios_sharp,
  //                             color: AppColors.white,
  //                           )),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),