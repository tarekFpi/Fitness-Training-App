// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:fitness_training_app/helper/shared_prefe/shared_prefe.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_lottie/app_lottie_json.dart';
import '../../components/custom_image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Future.delayed(const Duration(seconds: 3), () async{

        var token = await SharePrefsHelper.getString(AppConstants.bearerToken);

        if(token.isEmpty){
           Get.offAllNamed(AppRoutes.onboardingScreen);

         }else{

          ///Get.offAllNamed(AppRoutes.homeScreen);

          authController.getSubscriptionExtingCheck();
         }

      });
    });
  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Stack(
      children: [
        CustomImage(
            imageSrc: AppImages.splashScreen,
            fit: BoxFit.fitWidth,
            height: size.height,
            width: size.width),
        Positioned(
          right: 2,
          bottom: 20,
          height: 80.h,
          child: Lottie.asset(
            AppLottieJson.loading,
            height: 600.h,
            width: 400.w,
            fit: BoxFit.fill,
          ),
        )
      ],
    ));
  }
}
