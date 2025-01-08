// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:fitness_training_app/helper/time_converter/time_converter.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_images/app_images.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_dropdown/custom_dropdown.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/chat_screen/chat_screen.dart';
import 'package:fitness_training_app/view/screens/home_screen/inner_widget/custom_icon_widget.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/chat_monthly.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/chat_week_screen.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/inner_widget/custom_tracking_container.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_controller/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class ProgressTrackingScreen extends StatefulWidget {
  ProgressTrackingScreen({super.key});

  final ProgressController progressController = Get.find<ProgressController>();

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {

/*  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();*/

 /* void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDay = selectedDay;
    });
  }*/

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  var formattedDate = "";


  void formatDate(DateTime date) {

    formattedDate = DateFormat('yyyy-MM-dd').format(date);

    progressController.showProgressTrackingList(formattedDate);
  }

  final ProgressController progressController = Get.find<ProgressController>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var now = DateTime.now();

    var formatter = DateFormat('yyyy-MM-dd');

      formattedDate = formatter.format(now);

    progressController.showProgressTrackingList(formattedDate);
  }

  List<Color> gradientColors = [
    AppColors.brinkPink,
    AppColors.amber,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.progressTracking,showLeading: true,),
      body: Obx(
        () {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.grey06,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        List.generate(progressController.tabProgressTrackinglist.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              progressController.currentIndex.value = index;
                              progressController.update();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2.4,
                              //  height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: progressController.currentIndex.value == index
                                    ? AppColors.lightRed2
                                    : AppColors.grey06,
                              ),
                              child: CustomText(
                                text: progressController.tabProgressTrackinglist[index],
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          );
                        })),
                  ),


                SizedBox(height: 20.h,),

              if (progressController.currentIndex.value == 1)
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///============ Choose Date =============
                      CustomText(
                       // text: AppStrings.chooseDate,
                        text: "",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),

                  ///========= Dropdown ==============

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: AppColors.brinkPink,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          value: progressController.selectTime.value,
                          items: progressController.selectItem.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            progressController.selectTime.value = newValue!;
                          },
                        ),
                      )
                    ],
                  ),


            /*      Container(
                    height: 1.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: AppColors.grey_1,
                  ),*/

                  SizedBox(height: 20.h,),

                  ///================== Table Calendar =================

               if (progressController.currentIndex.value == 0)
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2100),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });

                        formatDate(_selectedDay!);
                      },
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: AppColors.brinkPink,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  if (progressController.currentIndex.value == 0)
                  SizedBox(height: 12.h,),

                  if (progressController.currentIndex.value == 0)
                  ///================== Activities =================
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.activities,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightRed2,
                      bottom: 20.h,
                    ),
                  ),


                  ///================== Custom Container =================
                  if (progressController.currentIndex.value == 0)
                  Column(
                    children: List.generate(progressController.progressTrackingList.length, (index) {

                      final model = progressController.progressTrackingList[index];

                      return CustomTrackingContainer(
                        title: "${model.exercise?.title}",
                        dateString:"${model.dateString}",
                        duration: "${model.exercise?.duration}",
                        time: "${model.exercise?.createdAt}",
                      );
                    }),
                  ),



                   if (progressController.currentIndex.value == 1)

                     SingleChildScrollView(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                       
                           SizedBox(
                             height: 20.h,
                           ),

                           Column(
                             children: [

                         if (progressController.currentIndex.value == 1 && progressController.selectTime.value == "Weekly")
                               BarChartWeek(),

                        if (progressController.selectTime.value == "Monthly" && progressController.currentIndex.value == 1)

                            BarChartMonthly(),


                               if (progressController.currentIndex.value == 1)
                               /// ================== Activities ===============================
                                 Align(
                                   alignment: Alignment.center,
                                   child: CustomText(
                                     text: "Achievements",
                                     fontSize: 20.sp,
                                     fontWeight: FontWeight.w700,
                                     color: AppColors.lightRed2,
                                     bottom: 12.h,
                                   ),
                                 ),
                                Divider(
                                  height: 14,
                                  color: Colors.white,
                                ),
                               SizedBox(
                                 height: 8,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   ///=================== Set workOut ==================
                                   Container(
                                     height: 150.h,
                                     width: 150.w,
                                     decoration: BoxDecoration(
                                         gradient: LinearGradient(
                                             colors: [AppColors.r1, AppColors.r2],
                                             begin: Alignment.topLeft,
                                             end: Alignment.bottomRight),
                                         borderRadius: BorderRadius.circular(5)),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                       Image.asset(AppIcons.chart_workout),
                                         SizedBox(
                                           height: 8.h,
                                         ),
                                         CustomText(
                                           text: "Completed ${progressController.chartStatusShowList.value.totalExercise} \n workout",
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppColors.black,
                                         ),

                                         CustomText(
                                           //text: "${progressController.chartStatusShowList.value.totalDuration} Min",
                                           text: DateConverter
                                               .convertTimeToMinutes(
                                               progressController.chartStatusShowList.value.totalDuration ??
                                                   ''),
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppColors.black,
                                         ),

                                         CustomText(
                                           text: "${progressController.chartStatusShowList.value.totalRep} Reps",
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppColors.black,
                                         ),
                                       ],
                                     ),
                                   ),

                                   ///=================== Set=======
                                   Container(
                                     height: 150.h,
                                     width: 150.w,
                                     decoration: BoxDecoration(
                                         gradient: LinearGradient(
                                             colors: [AppColors.r1, AppColors.r2],
                                             begin: Alignment.topLeft,
                                             end: Alignment.bottomRight),
                                         borderRadius: BorderRadius.circular(5)),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         Image.asset(AppIcons.chart_workout2),

                                         SizedBox(
                                           height: 8.h,
                                         ),
                                         CustomText(
                                           text: "Burn ${progressController.chartStatusShowList.value.totalEnergy} \n kcal",
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppColors.black,
                                         ),
                                         CustomText(
                                           text: "${progressController.chartStatusShowList.value.totalRep} Reps",
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppColors.black,
                                         ),
                                         CustomText(
                                           text: DateConverter
                                               .convertTimeToMinutes(
                                               progressController.chartStatusShowList.value.totalDuration ??
                                                   ''),
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.w500,
                                           color: AppColors.black,
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),

                             ],
                           ),
                           SizedBox(
                             height: 50.h,
                           ),

                           ///=================== Button=======

                           SizedBox(
                             height: 50.h,
                           )
                         ],
                       ),
                     )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
