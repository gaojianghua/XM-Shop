/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-21 14:15:34
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-21 17:07:46
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          LoginButton(text: "获取验证码", onPressed: () {
            Get.toNamed("/code-login-step-two");
          },)
        ],
      ),
    );
  }
}
