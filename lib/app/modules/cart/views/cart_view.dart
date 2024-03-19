/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-08 11:26:56
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-19 14:04:44
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_item_view.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('购物车'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              
            },
            child: Text(
              "编辑"
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              CartItemView()
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: ScreenAdapter.width(20),
                  right: ScreenAdapter.width(20)),
              width: double.infinity,
              height: ScreenAdapter.height(190),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: const Color.fromARGB(178, 240, 236, 236),
                          width: ScreenAdapter.height(2))),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.white, // 修改勾选标记的颜色
                          activeColor: Colors.red, // 修改 Checkbox 的填充颜色
                          shape: const CircleBorder(),
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // 去除 Checkbox 的默认内边距
                          visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4), // 调整 Checkbox 的视觉密度
                          value: true,
                          onChanged: (value) {}),
                      Text("全选")
                    ],
                  ),
                  Row(
                    children: [
                      Text("合计："),
                      Text(
                        "￥99.9",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(68),
                            color: Colors.red),
                      ),
                      SizedBox(width: ScreenAdapter.width(30)),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(255, 165, 0, 0.9)),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          onPressed: () {},
                          child: Text("结算"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
