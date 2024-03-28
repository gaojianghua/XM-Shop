/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-26 10:16:42
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-28 10:10:43
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('确认订单'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(10))
            ),
            child: const ListTile(
              leading: Icon(Icons.add_location),
              title: Text("增加收货地址"),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          SizedBox(
            height: ScreenAdapter.height(40),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(10))
            ),
            child: const ListTile(
              leading: Icon(Icons.add_location),
              title: Text("增加收货地址"),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
    );
  }
}
