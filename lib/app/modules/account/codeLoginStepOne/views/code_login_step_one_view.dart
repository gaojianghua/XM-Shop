/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-21 14:15:34
 * @LastEditors: 高江华
 * @LastEditTime: 2024-04-01 16:13:20
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/widget/input.dart';
import 'package:xmshop/app/widget/loginBotton.dart';
import 'package:xmshop/app/widget/logo.dart';
import 'package:xmshop/app/widget/userAgreement.dart';

import '../controllers/code_login_step_one_controller.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [TextButton(onPressed: () {}, child: const Text("帮助"))],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const LogoWidget(),
          Input(
            hintText: "请输入手机号",
            onChanged: (value) {},
          ),
          const UserAgreement(),
          LoginButton(text: "获取验证码", onPressed: () async {
            if (!GetUtils.isPhoneNumber(controller.telController.text) || controller.telController.text.length != 11) {
              Get.snackbar("提示信息", "手机号格式不合法");
            }else {
              MessageModel result = await controller.sendCode();
              if (result.success) {
                Get.offAndToNamed("/code-login-step-two", arguments: {
                  "tel": controller.telController.text
                });
              }else{
                Get.snackbar("提示信息", "手机号格式不合法");
              }
            }
          },),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                Get.offAndToNamed("/register-step-one");
              }, child: const Text("新用户注册")),
              TextButton(onPressed: () {
                Get.offAndToNamed("/pass-login");
              }, child: const Text("其他登录方式"))
            ],
          )
        ],
      ),
    );
  }
}
