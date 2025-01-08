// ignore_for_file: prefer_const_constructors

import 'package:fitness_training_app/view/screens/progress_tracking_screen/progress_tracking_controller/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../custom_text/custom_text.dart';

class CustomDropdown extends StatefulWidget {


  CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final ProgressController progressController = Get.find<ProgressController>();

  String? selectedValue = "Weekly";

  final List<String> dropdownItems = ["Weekly", "Monthly"];

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: AppColors.brinkPink,
          //color: AppColors.lightRed2,
          //border: Border.all(color: AppColors.red_500, width: .7),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
         // value: selectedValue ,
          value: progressController.selectTime.value,
          items: progressController.selectItem.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
             //setState(() {});
               //selectedValue = newValue;
               progressController.selectTime.value = newValue!;



          },
        ),
      ),
    );


    /*
    return Obx(() {


      return Container(
        height: 40.h,
        width: 80.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: AppColors.brinkPink,
         //color: AppColors.lightRed2,
          //border: Border.all(color: AppColors.red_500, width: .7),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
          hint: CustomText(
              text: AppStrings.newPassword,
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w700),
          borderRadius: BorderRadius.circular(15),
          elevation: 8,
          dropdownColor: AppColors.lightRed2,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.white,
          ),
          iconSize: 25,
          underline: const SizedBox(),
          //isExpanded: true, // This makes the dropdown full-width
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          value: progressController.selectTime.value,
          onChanged: (String? newValue) {
            progressController.selectTime.value = newValue!;
          },
          items: progressController.selectItem.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: CustomText(
                text: item,
                color: AppColors.white,
                fontSize: 16.w,
              ),
            );
          }).toList(),
        ),
      );
    });*/
  }
}