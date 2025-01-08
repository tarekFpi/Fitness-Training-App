// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<NavBar> {
  late int bottomNavIndex;

  final List<String> selectedIcon = [
/*    AppIcons.selectedHome,
    AppIcons.selectedTime,
    AppIcons.selectedGoal,
    AppIcons.selectedGraph,
    AppIcons.selectedPerson,*/
  ];
  final List<String> unselectedIcon = [
 /*   AppIcons.unselectedHome,
    AppIcons.unselectedTime,
    AppIcons.unselectedGoal,
    AppIcons.unselectedGraph,
    AppIcons.unselectedPerson,*/
  ];

  final List<String> userNavText = [
  /*  AppStrings.home,
    AppStrings.time,
    AppStrings.specialGoal,
    AppStrings.record,
    AppStrings.profile,*/
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      // color: AppColors.dartBlue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40.r), topLeft: Radius.circular(40.r)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.brinkPink, AppColors.brinkPink])),
      height: 80.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          selectedIcon.length,
          (index) => InkWell(
           // onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index == bottomNavIndex
                    ? Card(
                        elevation: 100,
                        shadowColor: AppColors.brinkPink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        color: Colors.transparent,
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: AppColors.brinkPink,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              selectedIcon[index],
                              height: 24.h,
                              width: 24.w,
                              // ignore: deprecated_member_use
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    : SvgPicture.asset(
                        unselectedIcon[index],
                        height: 24.h,
                        width: 24.w,
                        // ignore: deprecated_member_use
                        color: AppColors.brinkPink,
                      ),
                SizedBox(height: 4.h),
                index == bottomNavIndex
                    ? const SizedBox()
                    : CustomText(
                        text: userNavText[index],
                        color: AppColors.brinkPink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.w,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*  void onTap(int index) {
    if (index != bottomNavIndex) {
      switch (index) {
        case 0:
          Get.offAll(() => HomeScreen());
          break;
        case 1:
          Get.to(() => TimeScreen());
          break;
        case 2:
          Get.to(() => SpecialGoalScreen());
          break;
        case 3:
          Get.to(() => RecordScreen());
          break;
        case 4:
          Get.to(() => ProfileScreen());
      }
    }
  }*/
}
