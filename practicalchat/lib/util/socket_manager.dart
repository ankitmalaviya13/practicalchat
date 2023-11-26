

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalchat/app/modules/home/views/home_view.dart';
import 'package:practicalchat/util/preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../app/modules/home/controllers/home_controller.dart';
import '../app/modules/home/model/res_call_accept_model.dart';
import '../app/modules/home/model/res_call_request_model.dart';
import '../app/modules/home/views/call_page.dart';
import '../app/modules/home/views/pickup_screen.dart';
import 'constant.dart';

io.Socket? _socketInstance;

String? channelName;
String? channelToken;
ResCallAcceptModel? resCallAcceptModel;

//Initialize Socket Connection
dynamic initSocketManager() {
  print("fskjfhskjdfkjsd");
  // buildContext = context;
  // if (socket != null) return;
  _socketInstance = io.io(
    "${SocketConstants.socketUrl}",
    <String, dynamic>{
      SocketConstants.transportsHeader: [SocketConstants.webSocketOption],
    },
  );
  _socketInstance?.connect();
  socketGlobalListeners();
}

//Socket Global Listener Events
dynamic socketGlobalListeners() {
  print("fdskjfhdskjfdkjs");
  _socketInstance?.on(SocketConstants.eventConnect, onConnect);
  _socketInstance?.on(SocketConstants.eventDisconnect, onDisconnect);
  _socketInstance?.on(SocketConstants.onSocketError, onConnectError);
  _socketInstance?.on(SocketConstants.eventConnectTimeout, onConnectError);
  _socketInstance?.on(SocketConstants.socket_register_call, onsocketregistercall);
  _socketInstance?.on(SocketConstants.socket_disconnect, onDisconnect);
  _socketInstance?.on(SocketConstants.onCallRequest, handleOnCallRequest);
  _socketInstance?.on(SocketConstants.onAcceptCall, handleOnAcceptCall);
  _socketInstance?.on(SocketConstants.onRejectCall, handleOnRejectCall);

  _socketInstance?.on(SocketConstants.online_offline, (data) {
    print(data);
    print("fjsdhgiusdhfkjhkjd");
    HomeController homeController = Get.find();
    homeController.updatestatus(data);
    // onNewMessage(data);
  },);





}
bool? emit(String event, Map<String, dynamic> data) {
  print("===> emit $data");
  _socketInstance!.emit(event, jsonDecode(json.encode(data)));
  return _socketInstance?.connected;
}

//Get This Event After Successful Connection To Socket
dynamic onConnect(_) async {
print(_socketInstance?.id);
print(box.read(PrefsKey.userid));
print('nfjeincuyufhrhu');
print("Socket connect.....................");
  _socketInstance!.emit(
    "socket_register",
    {
      "user_id":await box.read(PrefsKey.userid),
    },
  );

  // ConsoleLogUtils.printLog("===> connected socket....................");
}


dynamic onConnectSocket() async {
  print(_socketInstance?.id);
  print(box.read(PrefsKey.userid));
  print('nfjeincuyufhrhu');

  print("Socket connect.....................");
  _socketInstance!.emit(
    "socket_register",
    {
      "user_id":await box.read(PrefsKey.userid),
    },
  );

  // ConsoleLogUtils.printLog("===> connected socket....................");
}



dynamic onsocketregistercall(data) async {
print(data);
print("Socket register successfully.....................");
}

//Get This Event After Connection Lost To Socket Due To Network Or Any Other Reason
dynamic onDisconnect(_) {
  print("Socket Disconnect.....................");

  // ConsoleLogUtils.printLog("===> Disconnected socket....................");
}

//Get This Event After Connection Error To Socket With Error
dynamic onConnectError(error) {
  // ConsoleLogUtils.printLog("===> ConnectError socket.................... $error");
}


//Get This Event When Someone Received Call From Other User
void handleOnCallRequest(dynamic response) {
  print("fdkjfhdskjfkjsdfksd");
  print(response);
  print(response["channel"]);


  if (response != null) {
    final data = ResCallRequestModel.fromJson(response);

    Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (buildContext) => PickUpScreen(
          resCallAcceptModel: ResCallAcceptModel(),
          isForOutGoing: false,
          resCallRequestModel: data,
          name: data.othername,
        ),
      ),
    );
    // NavigationUtils.push(buildContext!, RouteConstants.routePickUpScreen, arguments: {
    //   ArgParams.resCallAcceptModel: ResCallAcceptModel(),
    //   ArgParams.resCallRequestModel: data,
    //   ArgParams.isForOutGoing: false,
    // });
  }
}

//Get This Event When Other User Accepts Your Call
void handleOnAcceptCall(dynamic response) async {
  print("fdkjfhsdkjf");
  print(response.toString());
  if (response != null) {
    final data = ResCallAcceptModel.fromJson(response);
    resCallAcceptModel = data;
    channelName = data.channel;
    channelToken = data.token;
    Navigator.pushReplacement(
      Get.context!,
      MaterialPageRoute(
        builder: (buildContext) => CallPage(
          isForOutGoing: true,
          resCallAcceptModel: data,
          channelName: data.channel,
          resCallRequestModel: ResCallRequestModel(),
          token: data.token,
          name: data.name,
        ),
      ),
    );
    // NavigationUtils.pushReplacement(buildContext!, RouteConstants.routeVideoCall, arguments: {
    //   ArgParams.channelKey: data.channel,
    //   ArgParams.channelTokenKey: data.token,
    //   ArgParams.resCallAcceptModel: data,
    //   ArgParams.resCallRequestModel: ResCallRequestModel(),
    //   ArgParams.isForOutGoing: true,
    // });
  }
}

//Get This Event When Someone Rejects Call
void handleOnRejectCall(dynamic response) {
  // Navigator.pushAndRemoveUntil(
  //   buildContext,
  //   MaterialPageRoute(
  //     builder: (buildContext) => VideoCallingScreen(
  //       isForOutGoing: true,
  //       resCallAcceptModel: data,
  //       channelName: data.channel,
  //       resCallRequestModel: ResCallRequestModel(),
  //       token: data.token,
  //     ),
  //   ),
  // );
  Navigator.of(Get.context!).pushAndRemoveUntil(MaterialPageRoute(builder: (buildContext) => HomeView()), (Route<dynamic> route) => false);
  // NavigationUtils.pushAndRemoveUntil(
  //   buildContext!,
  //   RouteConstants.routeCommon,
  // );
}




