/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-08 11:18:46
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-12 17:05:02
 * @Description: file content
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/plist_model.dart';

class HomeController extends GetxController {
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  RxList<FocusItemModel> bestSellingSwiperList = <FocusItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<PlistItemModel> sellingPList = <PlistItemModel>[].obs;
  RxList<PlistItemModel> bestPList = <PlistItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFocusData();
    getCategoryData();
    getBestSellingData();
    getSellingPData();
    getHotGoodsData();
    scrollControllerListener();
  }

  void scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          flag.value = false;
          update();
        }
      }
    });
  }
  // 获取轮播图
  getFocusData() async {
    var response = await Dio().get("https://miapp.itying.com/api/focus");
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    update();
  }
  // 获取热销中的轮播图
  getBestSellingData() async {
    var response = await Dio().get("https://miapp.itying.com/api/focus?position=2");
    var sellingSwiper = FocusModel.fromJson(response.data);
    bestSellingSwiperList.value = sellingSwiper.result!;
    update();
  }
  // 获取热销中右侧商品
  getSellingPData() async {
    var response = await Dio().get("https://miapp.itying.com/api/plist?is_hot=1&pageSize=3");
    var sellingList = PlistModel.fromJson(response.data);
    sellingPList.value = sellingList.result!;
    update();
  }
  // 获取分类
  getCategoryData() async {
    var response = await Dio().get("https://miapp.itying.com/api/bestCate");
    var category = CategoryModel.fromJson(response.data);
    categoryList.value = category.result!;
    update();
  }
  // 获取热门商品数据
  getHotGoodsData() async {
    var response = await Dio().get("https://miapp.itying.com/api/plist?is_best=1");
    var pList = PlistModel.fromJson(response.data);
    bestPList.value = pList.result!;
    update();
  }
}
