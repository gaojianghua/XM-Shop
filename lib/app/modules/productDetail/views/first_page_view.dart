/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-17 12:13:03
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-17 23:44:37
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productDetail/controllers/product_detail_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class FirstPageView extends GetView {
  @override
  final ProductDetailController controller = Get.find();
  FirstPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        key: controller.gk1,
        width: ScreenAdapter.width(1080),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1/1,
              child: Image.network("https://gaojianghua.oss-cn-hangzhou.aliyuncs.com/home/gaojianghua.jpg", fit: BoxFit.cover)
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: ScreenAdapter.height(20),left: ScreenAdapter.width(20),right: ScreenAdapter.width(20)),
              child: Text(
                "高江华",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(46)
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(ScreenAdapter.height(20)),
              child: Text(
                "高江华",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenAdapter.fontSize(34)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: ScreenAdapter.width(20), right: ScreenAdapter.width(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          "价格：",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic
                          ),
                        ),
                        Text(
                          "￥128",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenAdapter.fontSize(66),
                            textBaseline: TextBaseline.alphabetic
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          "原价：",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.ideographic
                          ),
                        ),
                        Text(
                          "￥158",
                          style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenAdapter.fontSize(46),
                            decoration: TextDecoration.lineThrough,
                            textBaseline: TextBaseline.ideographic
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // 筛选
            Container(
              height: ScreenAdapter.height(140),
              padding: EdgeInsets.only(left: ScreenAdapter.width(20), right: ScreenAdapter.width(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "已选",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                        child: const Text("115，黑色，XL，1件"),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.black38, size: ScreenAdapter.fontSize(46),)
                ],
              ),
            ),
            // 门店
            Container(
              height: ScreenAdapter.height(140),
              padding: EdgeInsets.only(left: ScreenAdapter.width(20), right: ScreenAdapter.width(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "门店",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                        child: const Text("小米之家万达专卖店"),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.black38, size: ScreenAdapter.fontSize(46),)
                ],
              ),
            )
          ],
        ),
      );
  }
}
