import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/notification_screen/inner_widget.dart/custom_notification_card.dart';
import 'package:fitness_training_app/view/screens/notification_screen/inner_widget.dart/custom_notification_tab.dart';
import 'package:fitness_training_app/view/screens/notification_screen/notification_controller/notification_controller.dart';
import 'package:fitness_training_app/view/screens/resources_screen/resources_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        showLeading: true,
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

                if (notificationController.curentIndex.value == 0)
                Column(
                  children: List.generate(notificationController.remindersNotificationList.length, (index) {

                    final model = notificationController.remindersNotificationList[index];


                      return  InkWell(
                        onTap: (){

                         if(model.resourceName=="workout"){

                           if(model.resourceDetails?.programmeId!=""){

                           Get.offNamed(AppRoutes.workoutResourceScreen,
                                 arguments: [
                                   {
                                     "uid": model.resourceDetails?.programmeId,
                                   },
                                 ]);

                           }else{

                             showCustomSnackBar("Data is not available", isError: true);
                           }
                         }
                         if(model.resourceName=="article"){

                           Get.off(() => ResourcesScreen(),
                               arguments: [
                                 {
                                   "article":"article",
                                 },
                               ]
                           );
                         }

                         if(model.resourceName=="recipe_programme"){
                           Get.offNamed(AppRoutes.recipeIngredientsScreen,
                               arguments: [
                                 {
                                   "uid": model.resourceId,
                                 },
                               ]
                           );
                         }
                        },
                        child: CustomNotificationCard2(
                          notification: "${model.title}",
                          description: "${model.description}",
                          date: "${model.createdAt}",
                        ),
                      );
                  }),
                ),

                if (notificationController.curentIndex.value == 1)

                  Column(
                    children: List.generate(notificationController.systemNotificationList.length, (index) {

                      final model = notificationController.systemNotificationList[index];

                      return  CustomNotificationCard2(
                        notification: "${model.title}",
                        description: "${model.description}",
                        date: "${model.createdAt}",
                      );
                    }),
                  ),
           ],
            ),
          );
        }),
      ),
    );
  }
}
