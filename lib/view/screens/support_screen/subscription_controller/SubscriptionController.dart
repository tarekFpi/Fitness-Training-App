

import 'dart:convert';
import 'dart:io';
import 'package:fitness_training_app/core/app_routes/app_routes.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/support_screen/packageSubscriptionModel/MySubscriptionResponse.dart';
import 'package:fitness_training_app/view/screens/support_screen/packageSubscriptionModel/packageSubscriptionResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class  SubscriptionController extends GetxController{


  ///======================================>> Subscription Alert Dialog Show <<================================

  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(String amount, String package_id) async {
    try {
      paymentIntentData =
      await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
           //   setupIntentClientSecret: 'sk_test_51QWYK8A4wD44bbvwzJUA56sDyBNOXfODLHAY9AHF9N8HwqP5VmJxLoR5IBcis7fU3wh3Qbgs8T2dCqVFRX1z2Idx005zw2qIIE',
              paymentIntentClientSecret:
              paymentIntentData!['client_secret'],
              //applePay: PaymentSheetApplePay.,
              //googlePay: true,
              //testEnv: true,
              customFlow: true,
              style: ThemeMode.dark,
              // merchantCountryCode: 'US',
              merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(package_id);
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet(String package_id) async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
      )
          .then((newValue) {

        print('payment_id:' + paymentIntentData!['id'].toString());
        print('client_secret:' + paymentIntentData!['client_secret'].toString());
        print('amount:' + paymentIntentData!['amount'].toString());
        print('paymentIntentData:' + paymentIntentData.toString());
         //orderPlaceApi(paymentIntentData!['id'].toString());

        var payment_id = paymentIntentData!['id'];

     ///showCustomSnackBar("paid successfully", isError: false);

        stripePushData(package_id,payment_id);

        paymentIntentData = null;

      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: Get.context!,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' + 'sk_test_51QWYK8A4wD44bbvwzJUA56sDyBNOXfODLHAY9AHF9N8HwqP5VmJxLoR5IBcis7fU3wh3Qbgs8T2dCqVFRX1z2Idx005zw2qIIE',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }



  ///======================================>> my-subscription Api <<================================

  Rx<MySubscriptionResponse> mySubscriptionShow = MySubscriptionResponse().obs;


  Future<void> mySubcriptionShow() async {


    var response = await ApiClient.getData(ApiUrl.mySubscribe);

    if (response.statusCode == 200) {

      mySubscriptionShow.value = MySubscriptionResponse.fromJson(response.body["data"]);

      EasyLoading.dismiss();
      refresh();

    } else {

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





  ///======================================>> Stripe subscribe Api create <<================================

  Future<void> stripePushData(String package_id,String payment_id) async {

    var body = {
      "stripe_customer_id": payment_id,
      "package_id": package_id,
    };

    var response = await ApiClient.postData(ApiUrl.subscribeCreate,jsonEncode(body));

    if (response.statusCode == 201) {

      showCustomSnackBar("Subscribe created successfully...", isError: false);

      Get.offAllNamed(AppRoutes.homeScreen);

      EasyLoading.dismiss();
      refresh();

    } else {

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




  ///======================================>> Subscription package <<================================

  RxList<SubscriptionResponseModel> subscriptionShow = <SubscriptionResponseModel>[].obs;

  Future<void> subscriptionListShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var response = await ApiClient.getData(ApiUrl.package);

    if (response.statusCode == 200) {

    //  subscriptionShow.value = SubscriptionResponseModel.fromJson(response.body["data"]);

      subscriptionShow.value = List.from(response.body["data"].map((m)=> SubscriptionResponseModel.fromJson(m)));

      debugPrint("subscriptionShow:${subscriptionShow.value}");

      EasyLoading.dismiss();
      refresh();

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


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    subscriptionListShow();

    mySubcriptionShow();
  }

}