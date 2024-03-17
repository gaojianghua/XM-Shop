import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productDetail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class SecondPageView extends GetView {
  @override
  final ProductDetailController controller = Get.find();
  SecondPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        key: controller.gk2,
        alignment: Alignment.center,
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(1800),
        color: Colors.orange,
        child: Text("123"),
      );
  }
}
