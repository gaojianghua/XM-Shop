/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-16 09:32:47
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-19 16:35:25
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/pcontent_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

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
  List subTabList = [
    {"id": 1, "title": "商品介绍"},
    {"id": 2, "title": "规格参数"}
  ];
  RxInt selectedSubTabsIndex = 1.obs;
  // 保存筛选属性值
  RxString selectAttr = "".obs;
  // 购买数量
  RxInt buyNum = 1.obs;

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
        getContainerPosition(scrollController.position.pixels);
      }
      // 显示隐藏详情tab切换
      if (scrollController.position.pixels > gk2Position &&
          scrollController.position.pixels < gk3Position) {
        if (showSubHeaderTabs.value == false) {
          showSubHeaderTabs.value = true;
          selectedTabsIndex.value = 2;
          update();
        }
      } else if (scrollController.position.pixels > 0 &&
          scrollController.position.pixels < gk2Position) {
        if (showSubHeaderTabs.value == true) {
          showSubHeaderTabs.value = false;
          selectedTabsIndex.value = 1;
          update();
        }
      } else if (scrollController.position.pixels > gk2Position) {
        if (showSubHeaderTabs.value == true) {
          showSubHeaderTabs.value = false;
          selectedTabsIndex.value = 3;
          update();
        }
      }
      // 显示隐藏tabbar
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (opacity.value > 0.96) {
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
  getContainerPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2Position = box2.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.getStatusHeight() + ScreenAdapter.height(120));

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3Position = box3.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.getStatusHeight() + ScreenAdapter.height(120));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeSelectedTabsIndex(id) {
    selectedTabsIndex.value = id;
    update();
  }

  void changeSelectedSubTabsIndex(id) {
    selectedSubTabsIndex.value = id;
    scrollController.jumpTo(gk2Position);
    update();
  }

  void getProductDetail() async {
    var response = await https.get("api/pcontent?id=${Get.arguments["id"]}");
    if (response != null) {
      var pDetail = PcontentModel.fromJson(response.data);
      productDetail.value = pDetail.result!;
      productDetailAttr.value = productDetail.value.attr!;
      initAttr(productDetailAttr); // 初始化attr
      getAttr(); // 获取商品属性
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

  //attr属性变化
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

  //获取attr属性
  getAttr() {
    List tempList = [];
    for (var i = 0; i < productDetailAttr.length; i++) {
      for (var j = 0; j < productDetailAttr[i].attrList!.length; j++) {
        if (productDetailAttr[i].attrList![j]["checked"]) {
          tempList.add(productDetailAttr[i].attrList![j]["title"]);
        }
      }
    }
    selectAttr.value = tempList.join(",");
  }

  // 增加购买数量
  incBuyNum() {
    buyNum.value++;
    update();
  }

  // 减少购买数量
  decBuyNum() {
    if (buyNum.value > 1) {
      buyNum.value--;
      update();
    }
  }
}
