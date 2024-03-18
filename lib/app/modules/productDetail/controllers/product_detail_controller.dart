/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-16 09:32:47
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-18 17:59:31
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/pcontent_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductDetailController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxDouble opacity = 0.0.obs;
  List tabsList = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];
  RxInt selectedTabsIndex = 1.obs;
  RxBool showTabs = false.obs;
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  // 详情数据
  var productDetail = PcontentItemModel().obs;
  HttpsClient https = HttpsClient();
  RxList<PcontentAttrModel> productDetailAttr = <PcontentAttrModel>[].obs;
  // 元素的位置
  double gk2Position = 0;
  double gk3Position = 0;
  RxBool showSubHeaderTabs = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getProductDetail();
  }
  // 监听滚动条位置
  void scrollControllerListener() {
    scrollController.addListener(() {
      // 获取渲染后的元素位置
      if (gk2Position == 0 && gk3Position == 0) {
        getContainerPosition();
      }
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (opacity.value > 0.978) {
          opacity.value = 1;
        }
        if (showTabs.value == true) {
          showTabs.value = false;
        }
        update();
      } else {
        if (showTabs.value == false) {
          showTabs.value = true;
          update();
        }
      }
    });
  }
  // 获取元素位置
  getContainerPosition() {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2Position = box2.localToGlobal(Offset.zero).dy;
    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk2Position = box3.localToGlobal(Offset.zero).dy;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeSelectedTabsIndex(id) {
    selectedTabsIndex.value = id;
    update();
  }

  void getProductDetail() async {
    var response = await https.get("api/pcontent?id=${Get.arguments["id"]}");
    if (response != null) {
      var pDetail = PcontentModel.fromJson(response.data);
      productDetail.value = pDetail.result!;
      productDetailAttr.value = productDetail.value.attr!;
      initAttr(productDetailAttr);
      update();
    }
  }

  //初始化attr
  initAttr(List<PcontentAttrModel> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list!.length; j++) {
        if (j == 0) {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": true});
        } else {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": false});
        }
      }
    }
  }

  changeAttr(cate, title) {
    for (var i = 0; i < productDetailAttr.length; i++) {
      if (productDetailAttr[i].cate == cate) {
        for (var j = 0; j < productDetailAttr[i].attrList!.length; j++) {
          productDetailAttr[i].attrList![j]["checked"] = false;
          if (productDetailAttr[i].attrList![j]["title"] == title) {
            productDetailAttr[i].attrList![j]["checked"] = true;
          }
        }
      }
    }
    update();
  }
}
