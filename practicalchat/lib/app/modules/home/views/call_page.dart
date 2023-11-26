// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../util/constant.dart';
import '../../../../util/preferences.dart';
import '../model/arg_constants.dart';
import '../model/res_call_accept_model.dart';
import '../model/res_call_request_model.dart';



// Project imports:

class CallPage extends StatefulWidget {
  final String? channelName;
  final String? token;
  final ResCallRequestModel? resCallRequestModel;
  final ResCallAcceptModel? resCallAcceptModel;
  final bool? isForOutGoing;
  final name;
  final othername;
//
//   VideoCallingScreen({this.channelName, this.token, this.resCallRequestModel, this.resCallAcceptModel, this.isForOutGoing});
  CallPage({this.channelName, this.token, this.resCallRequestModel, this.resCallAcceptModel, this.isForOutGoing, this.name, this.othername});

  @override
  State<StatefulWidget> createState() => CallPageState();
}

class CallPageState extends State<CallPage> {
  ZegoUIKitPrebuiltCallController? callController;

  @override
  void initState() {
    super.initState();
    print(widget.resCallAcceptModel?.name);
    print(widget.isForOutGoing);
    print("fdskjhfjksdfskldfkl");
    print(widget.resCallRequestModel?.name);
    callController = ZegoUIKitPrebuiltCallController();
  }

  @override
  void dispose() {
    super.dispose();

    callController = null;
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, String>{}) as Map<String, String>;
    final callID = arguments[PageParam.call_id] ?? '';

    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: widget.isForOutGoing! ? int.parse(widget.resCallAcceptModel?.appid) : int.parse(widget.resCallRequestModel?.appid) /*292440099*/ /*input your AppID*/,
        appSign: widget.isForOutGoing!
            ? widget.resCallAcceptModel?.appsign
            : widget.resCallRequestModel?.appsign /*"a8b9b6901592206a15bbf265fed41633a8ddf6ae274410e7a3a30312521e29b9"*/ /*input your AppSign*/,
        userID: box.read(PrefsKey.userid),
        userName: widget.name??"",

        // widget.isForOutGoing == true ? "${widget.resCallAcceptModel?.name.toString().toUpperCase()}" : "${widget.resCallRequestModel?.name.toString().toUpperCase()}",
        callID: widget.channelName ?? "",
        controller: callController,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()

          /// support minimizing
          ..topMenuBarConfig.isVisible = true
          ..topMenuBarConfig.buttons = [
            ZegoMenuBarButtonName.minimizingButton,
            ZegoMenuBarButtonName.showMemberListButton,
          ]

          ///
          ..onOnlySelfInRoom = (context) {
            if (PrebuiltCallMiniOverlayPageState.idle != ZegoUIKitPrebuiltCallMiniOverlayMachine().state()) {
              ZegoUIKitPrebuiltCallMiniOverlayMachine().changeState(PrebuiltCallMiniOverlayPageState.idle);
            } else {
              Navigator.of(context).pop();
            }
          },
      ),
    );
  }
}
