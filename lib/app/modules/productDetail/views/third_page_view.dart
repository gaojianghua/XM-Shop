/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-17 23:03:47
 * @LastEditors: 高江华
 * @LastEditTime: 2024-04-02 11:00:33
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productDetail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ThirdPageView extends GetView {
  @override
  final ProductDetailController controller = Get.find();
  ThirdPageView({Key? key}) : super(key: key);

  // 省心优惠列表
  _masonryGridView() {
    return MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: ScreenAdapter.width(26),
        crossAxisSpacing: ScreenAdapter.width(26),
        itemCount: controller.bestPList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Get.toNamed('/product-detail',
                    arguments: {"id": controller.bestPList[index].sId});
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      child: Image.network(
                        HttpsClient.replaceUri(
                            controller.bestPList[index].sPic),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text(
                          "${controller.bestPList[index].title}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(36),
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text(
                          "${controller.bestPList[index].subTitle}",
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                        )),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text(
                          "￥${controller.bestPList[index].price}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(42),
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ))
                  ],
                ),
              ));
        });
  }

  // 省心优惠
  Widget _bestGoods() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30),
              ScreenAdapter.height(20), ScreenAdapter.width(30), 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "省心优惠",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(46)),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(26), right: ScreenAdapter.width(26)),
            color: const Color.fromRGBO(246, 246, 246, 1),
            child: Obx(() => _masonryGridView()))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      alignment: Alignment.center,
      width: ScreenAdapter.width(1080),
      child: _bestGoods(),
    );
  }
}
