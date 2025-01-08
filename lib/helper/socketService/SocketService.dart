






import 'package:fitness_training_app/helper/shared_prefe/shared_prefe.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketApi {
  // Singleton instance of the class
  factory SocketApi() {
    return _socketApi;
  }

  // Private constructor for singleton
  SocketApi._internal();

  static late io.Socket socket;

  ///<------------------------- Socket Initialization with Bearer Token ---------------->
  static Future<void> init() async {
    // Retrieve user ID and token
   // String userId = await SharePrefsHelper.getString(AppConstants.userId);
    String token = await SharePrefsHelper.getString(AppConstants.bearerToken);  // Assuming authToken is stored

    if (token.isEmpty) {
      debugPrint('User ID or token is missing. Cannot initialize socket.');
      return;
    }

    // Initialize the socket with auth token
    socket = io.io(
      ApiUrl.socketUrl,  // Your base URL construction method
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})  // Pass the JWT token here
          .build(),
    );

    debugPrint('$token => Socket initialization. Connected: ${socket.connected}');

    // Listen for socket connection
    socket.onConnect((_) {
      debugPrint('Socket Connected: ${socket.connected}');
    });

    // Handle unauthorized events
    socket.on('unauthorized', (data) {
      debugPrint('Unauthorized: $data');
    });

    // Listen for errors
    socket.onError((error) {
      debugPrint('Socket error: $error');
    });

    // Handle disconnection
    socket.onDisconnect((data) {
      debugPrint('Socket Disconnected: $data');
    });
  }

  ///<------------------------- Emit Events ------------------------->
  static void sendEvent(String eventName, dynamic data) {
    socket.emit(eventName, data);
  }

  ///<------------------------- event listeners ------------------------->
  static void listeners(String eventName, dynamic data) {
    socket.on(eventName, data);
  }

  // Singleton instance
  static final SocketApi _socketApi = SocketApi._internal();
}
























/*
import 'package:fitness_training_app/helper/shared_prefe/shared_prefe.dart';
import 'package:fitness_training_app/service/api_url.dart';
import 'package:fitness_training_app/utils/app_const/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

*/



















/*

class SocketApi {
  // Singleton instance of the class
  factory SocketApi() {
    return _socketApi;
  }

  // Private constructor for singleton
  SocketApi._internal();

  static late io.Socket socket;

  ///<------------------------- Socket Initialization with dynamic User ID ---------------->

  static void init() async {

    String token = await SharePrefsHelper.getString(AppConstants.bearerToken);
    if (token.isEmpty || token == "null") {
      return;
    }

    socket = io.io(
      ApiUrl.socketUrl,
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    debugPrint(
        '$token=============> Socket initialization, connected: ${socket.connected}');

    // Listen for socket connection
    socket.onConnect((_) {
      debugPrint(
          '==============>>>>>>> Socket Connected ${socket.connected} ===============<<<<<<<');
    });

    // Listen for unauthorized events
    socket.on('unauthorized', (dynamic data) {
      debugPrint('Unauthorized');
    });

    // Listen for errors
    socket.onError((dynamic error) {
      debugPrint('Socket error: $error');
    });

    // Listen for disconnection
    socket.onDisconnect((dynamic data) {
      debugPrint('>>>>>>>>>> Socket instance disconnected <<<<<<<<<<<<$data');
    });
  }
  static void sendEvent(String eventName, dynamic data)async {
    socket.emit(eventName, data, );
  }

  // Static instance of the class
  static final SocketApi _socketApi = SocketApi._internal();
}*/
