import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app/model/user_data_model.dart';
import 'package:get/get.dart';

import '../../constants/my_constant.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var userDataList = <UserDataModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    try {
      isLoading.value = true;
      QuerySnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('userid')
          .get();
      //userDataList.clear();
      for (var data in userData.docs) {
        userDataList.add(UserDataModel(
            data.id, data['full_name'], data['email'], data['phone']));
      }
      logger.i(userDataList[0].fullName);
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error Message", e.toString());
      isLoading.value=false;
    }
  }
}
