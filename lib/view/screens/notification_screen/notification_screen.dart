import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/notification_screen/inner_widget.dart/custom_notification_card.dart';
import 'package:fitness_training_app/view/screens/notification_screen/inner_widget.dart/custom_notification_tab.dart';
import 'package:fitness_training_app/view/screens/notification_screen/notification_controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_strings/app_strings.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController notificationController =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarContent: AppStrings.notification,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h), 
                //===================== Notification Tab =====================
                CustomNotificationTab(
                  tabNameList: notificationController.tabNamelist,
                  curentIndex: notificationController.curentIndex.value,
                  onTap: (value) {
                    notificationController.curentIndex.value = value;
                  },
                  selectedTextColor: AppColors.white,
                  unselectedTextColor: AppColors.lightRed2,
                  unselectedTabColor: Colors.white,
                  selectedTabColor: AppColors.lightRed2, 
                ),
                SizedBox(height: 20.h), 
                //===================== Notification Card =====================
                CustomText(
                  text: "Today",
                  fontSize: 12.w,
                  fontWeight: FontWeight.w700,
                  color: AppColors.brinkPink,
                ),
                SizedBox(height: 10.h),
                Column(
                  children: List.generate(2, (index) {
                    return const CustomNotificationCard2(
                      notification: "New workout is Available",
                      time: "June 10 - 8:00 AM",
                    );
                  }),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: "Yesterday",
                  fontSize: 12.w,
                  fontWeight: FontWeight.w700,
                  color: AppColors.brinkPink,
                ),
                SizedBox(height: 10.h),
                Column(
                  children: List.generate(3, (index) {
                    return const CustomNotificationCard2(
                      notification: "New workout is Available",
                      time: "June 10 - 8:00 AM",
                    );
                  }),
                ) , 
                 SizedBox(height: 20.h),
                CustomText(
                  text: "May 29 - 20XX",
                  fontSize: 12.w,
                  fontWeight: FontWeight.w700,
                  color: AppColors.brinkPink,
                ),
                SizedBox(height: 10.h),
                Column(
                  children: List.generate(8, (index) {
                    return const CustomNotificationCard2(
                      notification: "New workout is Available",
                      time: "June 10 - 8:00 AM",
                    );
                  }),
                )

              ],
            ),
          );
        }),
      ),
    );
  }
}
