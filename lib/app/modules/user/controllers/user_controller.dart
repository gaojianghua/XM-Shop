/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-08 11:27:05
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-22 13:58:42
 * @Description: file content
 */
import 'package:get/get.dart';
import 'package:xmshop/app/services/userServices.dart';

class UserController extends GetxController {
  RxBool isLogin = false.obs;
  RxList userList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserInfo() async {
    var tempLoginState = await UserServices.getUserLoginState();
    isLogin.value = tempLoginState;
    var tempList = await UserServices.getUserInfo();
    if (tempList.isNotEmpty) {
      userList.value = tempList;
    }
  }

  loginOut() {
    UserServices.loginOut();
    isLogin.value = false;
    userList.value = [];
    update();
  }
}
