import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarContent;
  final void Function()? onTap; 
  final bool? showLeading;

  const CustomAppBar({
    super.key,
    required this.appBarContent,
    this.onTap, this.showLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading:showLeading==true ? true:false,
        foregroundColor: Colors.transparent,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
   /*      leading: showLeading==true ? IconButton(
            onPressed: onTap ??
                () {
                  Navigator.pop(context);
                },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.lightRed,
              size: 20,
            )) : const SizedBox(),*/
        title: CustomText(
          text: appBarContent,
          fontSize: 20.w,
          fontWeight: FontWeight.w700,
          color: AppColors.lightRed2,
        ));

  }

  @override
  // TO DO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
