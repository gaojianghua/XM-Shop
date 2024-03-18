/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-16 09:32:47
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-18 17:47:37
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productDetail/views/first_page_view.dart';
import 'package:xmshop/app/modules/productDetail/views/second_page_view.dart';
import 'package:xmshop/app/modules/productDetail/views/third_page_view.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

  // 显示商品属性弹框
  void showAttr() {
    Get.bottomSheet(GetBuilder<ProductDetailController>(
      init: controller,
      builder: (controller) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          width: double.infinity,
          height: ScreenAdapter.height(1200),
          child: ListView(
            children: controller.productDetail.value.attr!.map((e) {
              return Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenAdapter.height(20),
                        left: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(1400),
                    child: Text(
                      "${e.cate}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenAdapter.height(20),
                        left: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(1040),
                    child: Wrap(
                      children: e.attrList!.map((v) {
                        return InkWell(
                          onTap: () {
                            controller.changeAttr(e.cate, v["title"]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(ScreenAdapter.width(20)),
                            child: Chip(
                              padding: EdgeInsets.only(
                                  left: ScreenAdapter.width(20)),
                              backgroundColor: v["checked"]
                                  ? Colors.red
                                  : const Color.fromARGB(31, 223, 213, 1),
                              label: Text("${v["title"]}"),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        );
      },
    ));
  }

  Widget _appBar(BuildContext context) {
    return Obx(() => AppBar(
          leading: Container(
              padding: EdgeInsets.all(ScreenAdapter.width(6)),
              child: Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                width: ScreenAdapter.width(88),
                height: ScreenAdapter.height(88),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )),
          title: SizedBox(
            width: ScreenAdapter.width(420),
            child: controller.showTabs.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.tabsList.map((value) {
                      return InkWell(
                          onTap: () {
                            controller.changeSelectedTabsIndex(value["id"]);
                            if (value["id"] == 1) {
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 300),
                                  controller.gk1.currentContext
                                      as BuildContext);
                            } else if (value["id"] == 2) {
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 300),
                                  controller.gk2.currentContext
                                      as BuildContext);
                            } else if (value["id"] == 3) {
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 300),
                                  controller.gk3.currentContext
                                      as BuildContext);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${value["title"]}",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(36)),
                                ),
                                value["id"] ==
                                        controller.selectedTabsIndex.value
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenAdapter.height(10)),
                                        width: ScreenAdapter.width(66),
                                        height: ScreenAdapter.height(4),
                                        color: Colors.red,
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenAdapter.height(10)),
                                        width: ScreenAdapter.width(66),
                                        height: ScreenAdapter.height(4),
                                      )
                              ],
                            ),
                          ));
                    }).toList())
                : const Text(""),
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.5),
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.height(88),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.black45, shape: BoxShape.circle),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.file_upload_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.height(88),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.black45, shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  showMenu(
                      color: Colors.black87.withOpacity(0.5),
                      context: context,
                      position: RelativeRect.fromLTRB(
                          ScreenAdapter.width(880),
                          ScreenAdapter.height(180),
                          ScreenAdapter.width(20),
                          0),
                      items: [
                        PopupMenuItem(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              Container(
                                width: ScreenAdapter.width(20),
                              ),
                              const Text(
                                "首页",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.chat_outlined,
                                color: Colors.white,
                              ),
                              Container(
                                width: ScreenAdapter.width(20),
                              ),
                              const Text(
                                "消息",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Container(
                                width: ScreenAdapter.width(20),
                              ),
                              const Text(
                                "收藏",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ]);
                },
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            )
          ],
        ));
  }

  Widget _subHeader() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: ScreenAdapter.height(120),
              alignment: Alignment.center,
              child: Text(
                "商品介绍",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: ScreenAdapter.height(120),
              alignment: Alignment.center,
              child: Text(
                "规格参数",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    ); 
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [FirstPageView(showAttr), SecondPageView(_subHeader), ThirdPageView()],
      ),
    );
  }

  Widget _bottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.height(160),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: ScreenAdapter.width(2), color: Colors.black26))),
        child: Row(
          children: [
            SizedBox(
              width: ScreenAdapter.width(200),
              height: ScreenAdapter.height(160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart),
                  Text(
                    "购物车",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 165, 0, 0.9)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {
                    showAttr();
                  },
                  child: const Text("加入购物车"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(253, 1, 0, 0.9)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {
                    showAttr();
                  },
                  child: const Text("立即购买"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
            child: _appBar(context)),
        body: Stack(
          children: [
            _body(), 
            _bottom(), 
            Positioned(
              left: 0,
              top: ScreenAdapter.getStatusHeight() + ScreenAdapter.height(118),
              right: 0,
              child: _subHeader(),
            )
          ]
        ));
  }
}
