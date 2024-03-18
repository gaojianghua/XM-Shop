/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-18 09:25:41
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-18 17:32:33
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productDetail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class SecondPageView extends GetView {
  @override
  final ProductDetailController controller = Get.find();
  final Function _subHeader;
  SecondPageView(this._subHeader, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        key: controller.gk2,
        alignment: Alignment.center,
        width: ScreenAdapter.width(1080),
        child: Column(
          children: [
            _subHeader()
          ],
        ),
      );
  }
}
