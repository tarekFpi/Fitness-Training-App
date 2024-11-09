// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/screens/community_screen/inner_widget/custom_create_post.dart';
import 'package:fitness_training_app/view/screens/community_screen/inner_widget/custom_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.communityName),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
          child: Column(

            children: [
              CustomCreatePost(),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: List.generate(10, (index) {
                  return CustomPostCard(
                    commentButton: () {

                    },
                    commentLength: "10",
                    loveButton: () {},
                    loveLenth: "10",
                    postImage: AppConstants.ntrition,
                    postTime: "10:10 PM",
                    postTitle: "jahid is very bad",
                    profileImage: AppConstants.girlsPhoto,
                    profileName: "jahida",
                    profileNameButton: () {},
                    moreButton: () {},
        
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
