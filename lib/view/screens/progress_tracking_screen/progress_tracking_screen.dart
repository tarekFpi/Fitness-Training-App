// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_dropdown/custom_dropdown.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/inner_widget/custom_tracking_container.dart';
import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_controller/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ProgressTrackingScreen extends StatefulWidget {
  ProgressTrackingScreen({super.key});
  final ProgressController progressController = Get.find<ProgressController>();

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.progressTracking),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///============ Choose Date =============
                  CustomText(
                    text: AppStrings.chooseDate,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),

                  ///========= Dropdown ===========
                  CustomDropdown()
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 1.h,
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.grey_1,
              ),
              SizedBox(height: 20.h,),
              ///================== Table Calendar =================
              Container(

                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: HeaderStyle(
                  titleTextStyle:
                      TextStyle(color: AppColors.lightRed2, fontSize: 16.sp),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (selectedDay) =>
                    isSameDay(selectedDay, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 10, 16),
              )),
              SizedBox(
                height: 30.h,
              ),

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
              Column(
                children: List.generate(6, (index) {
                  return CustomTrackingContainer();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
