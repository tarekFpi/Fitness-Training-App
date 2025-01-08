// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HelpCenterScreen extends StatelessWidget {
    HelpCenterScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.helpcenter,showLeading: true,),

      body: Obx(
        () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:   [

              SizedBox(
                height: 16,
              ),

              ListView.separated(
                shrinkWrap: true,
                 itemCount: profileController.setting_faqList.length,
                  itemBuilder: (BuildContext context,index){

                   final model = profileController.setting_faqList[index];

                 return  Padding(
                   padding: const EdgeInsets.only(top: 8),
                   child: ExpansionTile(
                      iconColor: Colors.white,
                     collapsedIconColor: Colors.white,
                     shape: const Border(),
                     title:  Align(
                       alignment: Alignment.topLeft,
                       child: CustomText(
                         text:
                         "${model.question}",
                         fontWeight: FontWeight.w400,
                         fontSize: 18,
                         color: AppColors.white,
                         maxLines: 3,
                       ),
                     ),
                     //  leading: Icon(Icons.person),
                     childrenPadding: EdgeInsets.only(left:12,bottom: 8),
                     expandedAlignment: Alignment.topLeft,
                   //  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                     children:  [

                       CustomText(
                         text:
                         "${model.answer}",
                         fontWeight: FontWeight.w400,
                         fontSize: 13,
                         color: AppColors.white,
                         textAlign: TextAlign.start,
                       )

                       //more child menu
                     ],
                   ),
                 );
              },separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12,right: 12),
                child: Divider(color: AppColors.brinkPink,),
              ),),




            ],
          );
        }
      ),
    );
  }
}
