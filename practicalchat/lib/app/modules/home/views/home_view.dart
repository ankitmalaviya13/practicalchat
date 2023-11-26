import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practicalchat/app/modules/home/views/pickup_screen.dart';
import 'package:practicalchat/util/preferences.dart';

import '../../../../util/constant.dart';
import '../../../../util/socket_manager.dart';
import '../controllers/home_controller.dart';
import '../model/arg_constants.dart';
import '../model/res_call_accept_model.dart';
import '../model/res_call_request_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Users'),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Obx(() {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.usersList.value.length,
                      itemBuilder: (context, index) {
                        var data = controller.usersList.value[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(data["name"]),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: data["status"] == "online"
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(data["status"]),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(onTap:(){
                                  emit(
                                      SocketConstants.connectCall,
                                      ({
                                        ArgParams.connectId: data["_id"],
                                        //Receiver Id
                                      }));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PickUpScreen(
                                        isForOutGoing: true,
                                        resCallAcceptModel: ResCallAcceptModel(otherUserId: data["_id"], name: data["name"]),
                                        resCallRequestModel: ResCallRequestModel(),
                                        name: data["name"],
                                      ),
                                    ),
                                  );
                                },child: Icon(Icons.video_call)),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
              Obx(() => controller.ishomeLoading.value
                  ? customIndicator
                  : Container()),
            ],
          ),
        );
      },
    );
  }
}
