import 'dart:convert';
import 'dart:io';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/community_screen/community_post_model/PostShowByIdResponseModel.dart';
import 'package:fitness_training_app/view/screens/community_screen/community_post_model/PostShowResponseModel.dart';
import 'package:fitness_training_app/view/screens/home_screen/home_model/recipi_program_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommuntyController extends GetxController {
  RxBool showAddImageOption = RxBool(false);

  RxInt maxLines = 1.obs;

  Rx<TextEditingController> postTextEditingController =
      TextEditingController().obs;

  Rx<TextEditingController> commetTextEditingController =
      TextEditingController().obs;

  final ImagePicker _picker = ImagePicker();
  //File? imagePath;
  var imagePath = ''.obs;

  Future<void> getImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Convert XFile to File if needed

        imagePath.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///==================== community post create api ============================

  Future<void> communityPostInsert() async {

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

    Map<String, String> body = {
      "data": jsonEncode({"content": postTextEditingController.value.text}),
    };

    var response = await ApiClient.postMultipartData(ApiUrl.createPostApi, body,
        multipartBody: [MultipartBody('media', File(imagePath.value))]);

    debugPrint("body:${response.body}");

    if (response.statusCode == 201) {
      showCustomSnackBar("Post created successfully", isError: false);
      EasyLoading.dismiss();
      refresh();

      imagePath.value = "";
      postTextEditingController.value.text == "";

      postCommnutyShowList();

    } else {

      EasyLoading.dismiss();
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ApiChecker.checkApi(response);

        return;
      } else {
        EasyLoading.dismiss();
        ApiChecker.checkApi(response);
        return;
      }
    }
  }



  ///==================== community comment create api ============================

  Future<void> commentInsert(String user_id) async {

    
    Map<String, String> body  = {

      "data": jsonEncode({"content": commetTextEditingController.value.text}),
    };

    var response = await ApiClient.postData(ApiUrl.createCommentApi(id: user_id), jsonEncode(body));

    debugPrint("body:${response.body}");

    if (response.statusCode == 201) {

    //  showCustomSnackBar("Comment created successfully", isError: false);

      refresh();

      commetTextEditingController.value.text = "";

      postCommnutyShowList();

    } else {

      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ApiChecker.checkApi(response);
        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }

  ///======================================>> Get community post show Api <<================================

  RxList<PostShowResponseModel> postShowList = <PostShowResponseModel>[].obs;

  Future<void> postCommnutyShowList() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.postShowApi);

    if (response.statusCode == 200) {

      postShowList.value = List.from(
          response.body["data"].map((m) => PostShowResponseModel.fromJson(m)));

   debugPrint("postCommnutyShowList:${postShowList.length.toString()}");

      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        EasyLoading.dismiss();
        return;
      } else {
        ApiChecker.checkApi(response);
        EasyLoading.dismiss();
        refresh();
        return;
      }
    }
  }

  ///======================================>> Get Commnuty Like Insert Api <<================================

  Future<void> commnutyLikeInsert(String post_id) async {
   // EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var body = {
      "workout_id": post_id,
    };

    var response = await ApiClient.postData(
        ApiUrl.postLikeInsert(id: post_id), jsonEncode(body));

    if (response.statusCode == 201) {
      EasyLoading.dismiss();
      refresh();
      postCommnutyShowList();
      //showCustomSnackBar(response.body["message"], isError: false);
    } else if (response.statusCode == 400) {
      EasyLoading.dismiss();
      refresh();
      showCustomSnackBar(response.body["message"], isError: true);
    } else {
      EasyLoading.dismiss();
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



  //======================================>> Get post Commnuty Like UnLine Api <<================================

  Future<void> postCommnutyLikeUnLike(String post_id) async {

    var response = await ApiClient.deleteData(
        ApiUrl.unLike(id: post_id));

    if (response.statusCode == 200) {

      refresh();
      postCommnutyShowList();
      postShowList.refresh();
     // showCustomSnackBar(response.body["message"], isError: false);
    } else if (response.statusCode == 400) {
      EasyLoading.dismiss();
      refresh();
      showCustomSnackBar(response.body["message"], isError: true);
    } else {
      EasyLoading.dismiss();
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


  ///======================================>> Get post Commnuty Like Show Buy Id Api <<================================
  RxList<LikeShowByIdResponseModel> likeShowList =
      <LikeShowByIdResponseModel>[].obs;

  Future<void> postLikeShowById(String post_id) async {

    var response = await ApiClient.getData(ApiUrl.postLikeShowById(id: post_id));

    if (response.statusCode == 200) {

      likeShowList.value = List.from(response.body["data"]
          .map((m) => LikeShowByIdResponseModel.fromJson(m)));

    } else {

      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }
  }

  RxList<Map<String, List>> likeList = <Map<String, List>>[].obs;



  @override
  void onInit() {
    super.onInit();

    postCommnutyShowList();
  }
}
