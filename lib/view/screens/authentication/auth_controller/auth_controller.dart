import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/helper/shared_prefe/shared_prefe.dart';
import 'package:fitness_training_app/helper/socketService/SocketService.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:fitness_training_app/view/screens/authentication/sign_up_screen/sign_up_varification_screen/sign_up_varification_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../utils/app_strings/app_strings.dart';

class AuthController extends GetxController {
  //=====================>> SIGN UP CONTROLLER <<====================

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

//===========================>> SIGN UP METHOD <<=======================

  RxBool signUpLoading = false.obs;

  Future<void> signUp() async {
    signUpLoading.value = true;
    refresh();

    var body = {
      "email": emailController.value.text,
      "password": passwordController.value.text, 
      "name": fullNameController.value.text
    };

    var response = await ApiClient.postData(ApiUrl.signUp, jsonEncode(body));

    if (response.statusCode == 200) {
      signUpLoading.value = false;
      refresh();
      showCustomSnackBar(response.statusText!, isError: false);
      Get.to(() => SignUpVerificationScreen(
            email: response.body["data"]["email"],
            title: AppStrings.signUp,
          ));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        signUpLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        signUpLoading.value = false;
        refresh();
        return;
      }
    }
  }

///============================>> VALIDATION CONTROLLER <<===========================

  Rx<TextEditingController> otpController = TextEditingController().obs;

  ///============================>> VALIDATION METHOD <<===========================

  RxBool validationLoading = false.obs;

  Future<void> validation(
      {required String email, required String title}) async {
    validationLoading.value = true;
    refresh();

    var body = {
      "email": email,
      "code": otpController.value.text,
    };

    var response = await ApiClient.postData(
        title == AppStrings.signUp
            ? ApiUrl.signUpverifyOTP
            : ApiUrl.forgotPasswordVerify,
        jsonEncode(body));

    if (response.statusCode == 200) {
      validationLoading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
      if (title == AppStrings.signUp) {
        Get.offAllNamed(AppRoutes.signInScreen);
      } else {
        SharePrefsHelper.setString(
            AppConstants.bearerToken, response.body["data"]["resetToken"]);
        Get.toNamed(AppRoutes.newPasswordScreen);
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        validationLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        validationLoading.value = false;
        refresh();
        return;
      }
    }
  }

  //================================>> SIGN IN CONTROLLER <<============================

  Rx<TextEditingController> signInEmailController = TextEditingController(
    text: kDebugMode ? "fedap49818@ronete.com" : "",
  ).obs;

  ///mehedihasan03796@gmail.com

  Rx<TextEditingController> signInPasswordController = TextEditingController(
    text: kDebugMode ? "12345678" : "",
  ).obs; // 12345678

  //================================>> SIGN IN METHOD <<============================

  RxBool signInLoading = false.obs;
  Future<void> signIn() async {
    signInLoading.value = true;
    refresh();
    var body = {
      "email": signInEmailController.value.text,
      "password": signInPasswordController.value.text
    };

    var response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));

    if (response.statusCode == 200) {
      signInLoading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]["accessToken"]);
      SharePrefsHelper.setString(
          AppConstants.email, signInEmailController.value.text);
      SharePrefsHelper.setString(
          AppConstants.password, signInPasswordController.value.text);


       getSubscriptionExtingCheck();

       // Get.offAllNamed(AppRoutes.registrationScreen);

       SocketApi.init();

    } else {

      signInLoading.value = false;
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }



  ///=================================>> subscription exiting Check <<===========================

  Future<void> getSubscriptionExtingCheck() async{

    var response = await ApiClient.getData(ApiUrl.subscribe_extingCheck);
    if (response.statusCode == 200) {

       if(response.body["data"] != null){

         Get.offAllNamed(AppRoutes.homeScreen);

      }else{

         Get.offAllNamed(AppRoutes.registrationScreen);
      }

    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        refresh();
        return;
      } else {

        ApiChecker.checkApi(response);

        refresh();
        return;
      }}
  }


  ///=================================>> GoogleSignIn  <<===========================

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Authentication
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }

      // Obtain the authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;

    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  ///=================================>> GoogleSignIn api implementation <<===========================

  RxBool googleAuthLoading = false.obs;

  Future<void> googleSignInApi(String email,String fcm_token,String image,String name,String contact_number) async {

    refresh();

    var body = {
      "email": email,
      "fcm_token": fcm_token,
      "img": image,
      "name": name,
      "contact_number":contact_number,
      "address":"",
    };

    var response =
    await ApiClient.postData(ApiUrl.socialAuth, jsonEncode(body));

    if (response.statusCode == 200) {

      googleAuthLoading.value = false;
      refresh();

      showCustomSnackBar(response.body["message"]!, isError: false);

      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]["accessToken"]);

        getSubscriptionExtingCheck();

      Get.offAllNamed(AppRoutes.homeScreen);

       debugPrint("accessToken=================:${response.body["data"]["accessToken"]}");

       SocketApi.init();

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        googleAuthLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        googleAuthLoading.value = false;
        refresh();
        return;
      }
    }
  }


  ///=================================>> FORGET PASSWORD CONTROLLER <<===========================

  Rx<TextEditingController> forgetEmailController = TextEditingController().obs;

  ///=================================>> FORGET PASSWORD METHOD <<===========================

  RxBool forgetPasswordLoading = false.obs;
  Future<void> forgetPassword() async {
    forgetPasswordLoading.value = true;
    refresh();
    var body = {"email": forgetEmailController.value.text};

    var response =
        await ApiClient.postData(ApiUrl.forgotPassword, jsonEncode(body));

    if (response.statusCode == 200) {
      forgetPasswordLoading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
      Get.to(() => SignUpVerificationScreen(
            email: forgetEmailController.value.text,
            title: AppStrings.forgotPassword,
          ));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        forgetPasswordLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        forgetPasswordLoading.value = false;
        refresh();
        return;
      }
    }
  }



  ///==================================== >> RESET PASSWORD CONTROLLER <<============================

  Rx<TextEditingController> resetNewPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> resetConfirmPasswordController =
      TextEditingController().obs;

  ///==================================== >> RESET PASSWORD METHOD <<============================

  RxBool resetPasswordLoading = false.obs;
  Future<void> resetPassword() async {
    resetPasswordLoading.value = true;
    refresh();
    var body = {
      "newPassword": resetNewPasswordController.value.text,
      "confirmPassword": resetConfirmPasswordController.value.text,
    };

    var response = await ApiClient.postData(
        ApiUrl.forgotCreateNewPassword, jsonEncode(body));

    if (response.statusCode == 200) {
      resetPasswordLoading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"], isError: false);
      Get.offAllNamed(AppRoutes.signInScreen); 

    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        resetPasswordLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        resetPasswordLoading.value = false;
        refresh();
        return;
      }
    }
  }



 /// ====================== user password Change ======================================

  Rx<TextEditingController> oldPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> newPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> comPasswordController =
      TextEditingController().obs;

  Future<void> userPasswordChange() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    refresh();

    var body = {
      "oldPassword": oldPasswordController.value.text,
      "newPassword": newPasswordController.value.text,
    };

    var response = await ApiClient.postData(
        ApiUrl.chagnePassword, jsonEncode(body));

    if (response.statusCode == 200) {

      refresh();
      showCustomSnackBar(response.body["message"], isError: false);

      Get.toNamed(AppRoutes.profileScreen);
      EasyLoading.dismiss();

    } else {

      EasyLoading.dismiss();

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        refresh();
        return;
      }
    }
  }

  ///============================== >> Biometric Authentication <<==============================

  RxBool emailAndPasswordAvailable = false.obs;

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticate() async {
    auth.isDeviceSupported().then(
          (bool isSupported) =>
              isSupported ? deviceSupported() : deviceNotSupported(),
        );
  }

///============================= DEVICE SUPPORTED METHOD ==============================

  Future<void> deviceSupported() async {
    debugPrint("Device supported");

    bool isDeviceSupported = await auth.isDeviceSupported();
    bool canCheckBiometrics = await auth.canCheckBiometrics;

    // Exit early if biometrics are not supported or available
    if (!isDeviceSupported || !canCheckBiometrics) {
      debugPrint("Biometric authentication not available on this device.");
      return;
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint (or face) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      // Specific handling for 'NotAvailable' or any other PlatformException
      if (e.code == 'NotAvailable') {
        debugPrint("Biometric authentication not set up on the device.");
      } else {
        debugPrint("Authentication error: $e");
      }
      return;
    }

    if (authenticated) {
      // Fetch and display saved credentials if authentication succeeds
      final email = await SharePrefsHelper.getString(AppConstants.email);
      final password = await SharePrefsHelper.getString(AppConstants.password);

      debugPrint("Email: $email");
      debugPrint("Password: $password");

      signInEmailController.value.text = email;
      signInPasswordController.value.text = password;

      signIn();
    }
  }

//============================= DEVICE NOT SUPPORTED METHOD ==============================

  deviceNotSupported() async {
    debugPrint("Device Not Supported");

    showCustomSnackBar('Security not supported', isError: true);
    AppSettings.openAppSettings(type: AppSettingsType.security);
  }

  //============================>> GET EMAIL AND PASSWORD METHOD <<===========================

  getEmailAndPassword() async {
    final email = await SharePrefsHelper.getString(AppConstants.email);
    final password = await SharePrefsHelper.getString(AppConstants.password);
    if (email.isNotEmpty && password.isNotEmpty) {
      emailAndPasswordAvailable.value = true;
      refresh();
    } else {
      emailAndPasswordAvailable.value = false;
      refresh();
    }
  }

  //============================= >> ON INIT METHOD <<=============================

  @override
  void onInit() {
    super.onInit();
    getEmailAndPassword();
  }
}
