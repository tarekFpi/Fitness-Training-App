import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/core/dependency/dependency_injection.dart';
import 'package:fitness_training_app/helper/shared_prefe/shared_prefe.dart';
import 'package:fitness_training_app/helper/socketService/SocketService.dart';
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/device_utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  // Get.put(NetworkController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = AppStrings.publishableKey;

  await Stripe.instance.applySettings();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark
  ));

  await GetStorage.init();
  
 runApp( MyApp());

  configLoading();

  SocketApi.init();
}


void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..backgroundColor = AppColors.brinkPink
    ..indicatorColor = AppColors.brinkPink
    ..textColor = AppColors.brinkPink
    ..maskColor = Colors.white.withOpacity(0.8);
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      child: GetMaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.black,
            appBarTheme: const AppBarTheme(
                surfaceTintColor: AppColors.brinkPink,
                toolbarHeight: 65,
                elevation: 0,
                centerTitle: true,
                backgroundColor: AppColors.white,
                iconTheme: IconThemeData(color: AppColors.white))),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute:  AppRoutes.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoutes.routes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
