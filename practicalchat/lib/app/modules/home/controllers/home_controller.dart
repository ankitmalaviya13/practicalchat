import 'package:get/get.dart';

import '../../../../util/common_widgets.dart';
import '../../../data/network/apis/home apis.dart';

class HomeController extends GetxController {

  HomeApi homeApi = HomeApi();
  var ishomeLoading = false.obs;
RxList usersList = [].obs;
  @override
  void onInit() {
    getUsers();
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

  getUsers() async {
    ishomeLoading.value = true;
    final response = await homeApi.allusers(

      headers: {'Authorization': '${homeApi.useToken}'},
    );
    print('response.data');
    print(response.data);
    if (response.statusCode == 200) {



      if (response.data["Status"] == 1) {
        ishomeLoading.value = false;
        usersList.value=   response.data["info"];
      }else{
        ishomeLoading.value = false;
        Toasty.showtoast(response.data["Message"].toString());
      }

    } else {
      ishomeLoading.value = false;
      Toasty.showtoast(response.data["Message"].toString());
    }
  }
  updatestatus(data){
    print("fksjdfhskdjfhkjsdf");
    for (var i=0;i< usersList.length;i++){
      print(usersList[i]["_id"]);
      print(data["user_id"]);
      if(data["user_id"]==usersList[i]["_id"]){
        usersList[i]["status"]= data["status"];
      }
      usersList.refresh();
      print(usersList);
      update();
    }
  }
}
