// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_loader/custom_loader.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:fitness_training_app/view/screens/workout_resource_screen/inner_widget/custom_container.dart';
import 'package:fitness_training_app/view/screens/workout_resource_screen/inner_widget/custom_round_container.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutLatestRespons.dart';
import 'package:fitness_training_app/view/screens/workout_screen/model/WorkoutResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WorkoutResourceScreen extends StatefulWidget {
  WorkoutResourceScreen({super.key});

  @override
  State<WorkoutResourceScreen> createState() => _WorkoutResourceScreenState();
}

class _WorkoutResourceScreenState extends State<WorkoutResourceScreen> {

  // final WorkoutLatestResponse workOutLatestModel= Get.arguments;

  var argumentData = Get.arguments;

  final HomeController homeController = Get.find<HomeController>();


  @override
  void initState() {
    super.initState();

     if(argumentData[0]["uid"]!=""){

      homeController.getWorkOutVidoeListById(argumentData[0]["uid"]);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.workoutResource),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

               CustomContainer(
                  workoutTitle: argumentData[0]['title'],
                  workoutDuration: argumentData[0]['duration'],
                  img: argumentData[0]['img']),

                 SizedBox(
                 height: 20.h,
                 ),

              ///================= round1 Text ===============
                Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: AppStrings.round1,
                  //  text: "${argumentData[0]['uid']}",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightRed,
                ),
               ),

              SizedBox(
                height: 10.h,
              ),

              ///================= round1 Container===============
             Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeController.workOutVideolist.length,
                    itemBuilder: (BuildContext context, index) {

                      return homeController.workOutVideolist[index].round == "1"
                          ? CustomRoundContainer(
                              workListSingleList:
                                  homeController.workOutVideolist[index])
                          : SizedBox();
                    });
              }),

             /*CustomRoundContainer(),
              CustomRoundContainer(),
              CustomRoundContainer(),*/

               ///================= round2 Text ===============
               Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: AppStrings.round2,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightRed,
                ),
              ),

              SizedBox(
                height: 10.h,
              ),

              Obx(() {
                return homeController.workOutVidoeLoading.value?CustomLoader(): ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeController.workOutVideolist.length,
                    itemBuilder: (BuildContext context, index) {

                      return homeController.workOutVideolist[index].round == "2"
                          ? CustomRoundContainer(
                          workListSingleList:
                          homeController.workOutVideolist[index])
                          : SizedBox();
                    });
              }),

           /*   ///================= round1 Container===============
              CustomRoundContainer(),
              CustomRoundContainer(),
              CustomRoundContainer(), */
            ],
          ),
        ),
      ),
    );
  }
}
