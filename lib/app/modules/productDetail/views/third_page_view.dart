/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-17 23:03:47
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-17 23:09:08
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productDetail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ThirdPageView extends GetView {
  @override
  final ProductDetailController controller = Get.find();
  ThirdPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        key: controller.gk3,
        alignment: Alignment.center,
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(1800),
        color: Colors.orange,
        child: Text("123"),
      );
  }
}
