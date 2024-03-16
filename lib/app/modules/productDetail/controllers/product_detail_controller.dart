/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-16 09:32:47
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-16 14:20:16
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxDouble opacity = 0.0.obs;
  List tabsList = [
    {
      "id": 1,
      "title": "商品"
    },
    {
      "id": 2,
      "title": "详情"
    },
    {
      "id": 3,
      "title": "推荐"
    }
  ];
  RxInt selectedTabsIndex = 1.obs;
  RxBool showTabs = false.obs;
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
  }

  void scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (showTabs.value == true) {
          showTabs.value  = false;
        }
        update();
      }else {
        if (showTabs.value == false) {
          showTabs.value  = true;
          update();
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeSelectedTabsIndex(id) {
    selectedTabsIndex.value = id;
    update();
  }
}
