// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_icons/app_icons.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_image/custom_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/profile_screen/edit_profile_screen/edit_profile_controller/edit_profile_controller.dart';
import 'package:fitness_training_app/view/screens/profile_screen/inner_widget/custom_header_container.dart';
import 'package:fitness_training_app/view/screens/profile_screen/inner_widget/custom_profile_name_list.dart';
import 'package:fitness_training_app/view/screens/profile_screen/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   final ProfileController profileController = Get.find<ProfileController>();

   final EditProfileController editProfileController =Get.find<EditProfileController>();


   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.profileText,showLeading: true,),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                CustomHeaderContainer(),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [

                ///================== Profile ===========================

                    CustomProfileNameList(
                        onTap: () {
                          Get.toNamed(AppRoutes.editProfileScreen);
                        },
                        imageSrc: AppIcons.person,
                        text: AppStrings.profile),

                    ///================== Change Password =================
                    CustomProfileNameList(
                        onTap: () {
                          Get.toNamed(AppRoutes.changePasswordScreen);
                        },
                        imageSrc: AppIcons.changePassword,
                        text: AppStrings.changePassword),

                    ///================== favoriteScreen =================
                    CustomProfileNameList(
                        onTap: () {
                          Get.toNamed(AppRoutes.favoriteScreen);
                        },
                        imageSrc: AppIcons.favoriteIcon,
                        text: AppStrings.favorite),

                    ///================== privacyPolicyScreen =================
                    CustomProfileNameList(
                        onTap: () {
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        },
                        imageSrc: AppIcons.lockIcon,
                        text: AppStrings.privacyPolicyName),

                    ///================== visaCardScreen =================
                    CustomProfileNameList(
                        onTap: () {
                          Get.toNamed(AppRoutes.visaCardScreen);
                        },
                        imageSrc: AppIcons.wallet,
                        text: AppStrings.paymentName),

                    /// ================== favorite ===================

                  /*
                      CustomProfileNameList(
                        onTap: () {
                          Get.toNamed(AppRoutes.changePasswordScreen);
                        },
                        imageSrc: AppIcons.settingIcon,
                        text: AppStrings.settingsName),
                   */

                    ///================== Help =================
                    CustomProfileNameList(
                      onTap: (){
                        Get.toNamed(AppRoutes.helpCenterScreen);
                      },
                        imageSrc: AppIcons.hadphoneIcon, text: AppStrings.helpName),

                    SizedBox(
                      height: 20.h,
                    ),
                   Padding(
                     padding: const EdgeInsets.only(left: 25, right: 25,),
                     child: Column(
                       children: [
                         /// ================== Level =================

                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [

                             Row(
                               children: [
                                 CustomImage(imageSrc: AppIcons.levelicon,imageColor: AppColors.lightRed2,),
                                 CustomText(
                                   left: 20.h,
                                   text: AppStrings.level,
                                   fontSize: 18.sp,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.white,
                                 ),
                               ],
                             ),
                             CustomText(
                             //  text: "Intermedieate",
                               text: "${editProfileController.userProfileShow.value.userData?.physicalLevel}",
                               fontSize: 18.sp,
                               fontWeight: FontWeight.w400,
                               color: AppColors.grey001,
                             ),
                           ],
                         ),
                         SizedBox(height: 20.h,),

                         ///================== Goal =================
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                               children: [
                                 CustomImage(imageSrc: AppIcons.goalIcon,imageColor: AppColors.lightRed2,),
                                 CustomText(
                                   left: 20.h,
                                   text: AppStrings.goal,
                                   fontSize: 18.sp,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.white,
                                 ),
                               ],
                             ),
                             CustomText(
                               //text: "Fix FlaT But",
                               text: "${editProfileController.userProfileShow.value.userData?.fitnessGoal}",
                               fontSize: 18.sp,
                               fontWeight: FontWeight.w400,
                               color: AppColors.grey001,
                             ),
                           ],
                         ),
                         SizedBox(height: 50.h,),
                         ///================== LogOut =================
                       ],
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: (){
                          profileController.showPopup();
                        },
                        child: Row(
                          children: [

                            CustomImage(imageSrc: AppIcons.logoutIcon,imageColor: AppColors.lightRed2,),
                            CustomText(
                              text: AppStrings.logOutName,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
