import 'dart:async';


import 'package:get/get.dart';
import 'package:practicalchat/app/data/network/apis/home%20apis.dart';
import 'package:practicalchat/app/modules/home/views/home_view.dart';

import '../../../../util/constant.dart';
import '../../../../util/preferences.dart';
import '../../../../util/socket_manager.dart';
import '../../Login_Signup/views/login_view.dart';

class SplashController extends GetxController {
  var userToken;
  var isAuth;
  @override
  void onInit() async {
    userToken = await box.read(PrefsKey.userToken);


    initSocketManager();
    Rout();
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Rout() async {
    userToken = await box.read(PrefsKey.userToken);
    Timer(
      Duration(seconds: 3),
      () => Get.offAll(
        () =>
          userToken == null || userToken == 'null' || userToken == ''
            ? LoginView()
            : HomeView()
      ),
    );
  }



  // getNotification() {
  //   print('uxncfycftdhtbg');
  //   notification.requestNotificationPermission();
  //   notification.getDeviceToken();
  //   notification.firebaseInit(Get.context!);
  //   notification.initLocalNotifications(Get.context!, RemoteMessage());
  //   notification.setupInteractMessage(Get.context!);
  //   notification.showNotification(RemoteMessage());
  // }



}
