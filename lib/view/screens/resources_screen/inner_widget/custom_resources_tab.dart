import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResourcesTab extends StatelessWidget {
  const CustomResourcesTab({
    super.key,
    required this.tabNameList,
    required this.curentIndex,
    required this.onTap,
    this.selectedTabColor,
    this.unselectedTabColor,
    this.selectedTextColor,
    this.unselectedTextColor, this.width,
  });

  final List<String> tabNameList;
  final int curentIndex;
  final Function(int index) onTap;
  final Color? selectedTabColor;
  final Color? unselectedTabColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        tabNameList.length,
            (index) => GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            width:width?? 170.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
              curentIndex == index ? selectedTabColor : unselectedTabColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomText(
              text: tabNameList[index],
              fontSize: 14.w,
              fontWeight: FontWeight.w500,
              color: curentIndex == index
                  ? selectedTextColor ?? Colors.white
                  : unselectedTextColor ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
