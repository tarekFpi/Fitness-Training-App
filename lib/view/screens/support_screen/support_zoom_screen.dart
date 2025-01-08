
import 'package:fitness_training_app/utils/app_colors/app_colors.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:fitness_training_app/view/components/custom_button/custom_button.dart';
import 'package:fitness_training_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:fitness_training_app/view/components/custom_text/custom_text.dart';
import 'package:fitness_training_app/view/screens/chat_screen/chat_controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ZoomCallScreen extends StatefulWidget {
  ZoomCallScreen({super.key});

  @override
  State<ZoomCallScreen> createState() => _ZoomCallScreenState();
}

class _ZoomCallScreenState extends State<ZoomCallScreen> {

  final String url = "https://us05web.zoom.us/j/89988476965?pwd=vhac5Przq2jvESJpqYULGOxK9MGBRz.1";

 late  WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(url)) {

              _launchZoom(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          url));
  }


  void _launchZoom(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open Zoom link')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: "Via Zoom Calls",showLeading: true,),

     body: WebViewWidget(controller: controller),

    /*  body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ///============================= via ZoomCalls Screen =============================
       *//*   SizedBox(
            width: MediaQuery.sizeOf(context).width *2,
            height: 50,
            child: CustomText(
              text: "https://us05web.zoom.us/j/81840449145?pwd=I45OPaY6WL7mdb6szkgcRexuLyXGC0.1",
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),

          SizedBox(
            height: 16.h,
          ),*//*



          CustomButton(
            onTap: () {

              zoomCall();
            },
            width: MediaQuery.sizeOf(context).width / 2,
            fillColor: AppColors.black_60,
            isBorder: true,
            fontSize: 18.w,
            borderWidth: .8,
            textColor: AppColors.lightRed2,
            title: "Join naw",
          )
        ],
      ),*/
    );
  }

}

