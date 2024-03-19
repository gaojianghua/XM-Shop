/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-19 11:06:17
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-19 13:46:01
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_item_number_view.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class CartItemView extends GetView {
  const CartItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: const Color.fromARGB(178, 240, 236, 236),
          width: ScreenAdapter.height(2)
        )),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
              width: ScreenAdapter.width(100),
              child: Checkbox(
                  activeColor: Colors.red,
                  shape: const CircleBorder(),
                  materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap, // 去除 Checkbox 的默认内边距
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  value: false,
                  onChanged: (value) {})),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.width(24)),
            margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
            width: ScreenAdapter.width(260),
            child: Image.network("https://blog-cli.oss-cn-hangzhou.aliyuncs.com/kfidegf11wd.jpg", fit: BoxFit.fitHeight),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(36),
                      fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [Chip(label: Text("黑色"))],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "￥99.9",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(68),
                          color: Colors.red),
                    ),
                    const CartItemNumberView()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
