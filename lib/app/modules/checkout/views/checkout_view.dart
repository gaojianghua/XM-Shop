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


  Widget checkoutItem() {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: ScreenAdapter.width(180),
            height: ScreenAdapter.height(180),
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: Image.network("https://gaojianghua.oss-cn-hangzhou.aliyuncs.com/0.jpg", fit: BoxFit.fitHeight),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "小米Pro",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(42),
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: ScreenAdapter.height(10)),
                Text(
                  "白色128G"
                ),
                SizedBox(height: ScreenAdapter.height(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "￥128",
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                    Text(
                      "x2",
                      style: TextStyle(
                        color: Colors.black12
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

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
            padding: EdgeInsets.only(
                top: ScreenAdapter.height(20),
                bottom: ScreenAdapter.height(20)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(10))),
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
            padding: EdgeInsets.only(
                top: ScreenAdapter.height(20),
                bottom: ScreenAdapter.height(20)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(10))),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("张三 15257184434"),
                  SizedBox(height: ScreenAdapter.height(10)),
                  Text("藏龙东街藏龙星天地")
                ],
              ),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          SizedBox(
            height: ScreenAdapter.height(40),
          ),
          Container(
            padding: EdgeInsets.only(
                top: ScreenAdapter.height(20),
                bottom: ScreenAdapter.height(20)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(10))),
            child: Column(
              children: [
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
