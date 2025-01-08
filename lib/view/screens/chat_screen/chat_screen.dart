// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/screens/chat_screen/chat_controller/chat_controller.dart';
import 'package:fitness_training_app/view/screens/chat_screen/inner_widget/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  // Initialize the ChatController
  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.supportChatText),
      body: Column(
          children: [

            SizedBox(height: 50.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: ListView.builder(
                  itemCount: 10, // Replace with actual chat message count from the controller if needed
                  shrinkWrap: true,
               //   physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return CustomChatCard(
                      title: 'Rossi Mario',
                      subtitle: 'Come stai oggi?',
                      imageUrl: AppConstants.userNtr,
                      time: '2 min ago',
                      isActive: true,
                      onTap: () {
                        Get.toNamed(AppRoutes.messageScreen);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}
