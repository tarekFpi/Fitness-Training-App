import 'package:fitness_training_app/helper/socketService/SocketService.dart';
import 'package:fitness_training_app/service/api_check.dart';
import 'package:fitness_training_app/service/api_client.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/ToastMsg/toast_message.dart';
import 'package:fitness_training_app/utils/app_strings/app_strings.dart';
import 'package:fitness_training_app/view/screens/chat_screen/chat_model/chatMessagesResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{ 
   

 RxList<String> messageTabList = <String>[ 
  AppStrings.tuttoilpersonale,
  AppStrings.medici, 
  AppStrings.farmacia, 
  
 ].obs; 

 RxInt tabCurrentIndex = 0.obs;

 Rx<TextEditingController> messageController = TextEditingController().obs;




 ///======================= Send message =================
 void sendChat(){

  if(messageController.value.text.isNotEmpty){

   var response = {
    "receiver_id": 'user123',
    "message":  messageController.value.text,
    "message_type": 'text'
   };

   SocketApi.sendEvent('send-message', response);

  showUserChatList();

   messageController.value.text="";
  }
 }


 ///======================================>> get listen chat New message  <<================================

 listenNewMessage()async {
  debugPrint("Faction Socket===========>>>>>>>>>>>>");
  SocketApi.socket.on("message-receive", (dynamic value) async{
   debugPrint("message-receive Socket===========>>>>>>>>>>>>$value");

   showUserChatList();

   refresh();

  });
 }



 ///======================================>> get message chat show <<================================

 RxList<ChatMessagesResponseModel> chatMessageModelList = <ChatMessagesResponseModel>[].obs;


 Future<void> showUserChatList() async {

  ///EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

  var response = await ApiClient.getData(ApiUrl.chatMessage);

  if (response.statusCode == 200) {

   chatMessageModelList.value = List.from(response.body["data"]["data"].map((m)=> ChatMessagesResponseModel.fromJson(m)));
   debugPrint("chatMessageModelList:${chatMessageModelList.length.toString()}");
   EasyLoading.dismiss();
    chatMessageModelList.refresh();
   refresh();

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


 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    listenNewMessage();
    showUserChatList();
  }

}