/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-04-11 14:56:28
 * @LastEditors: 高江华
 * @LastEditTime: 2024-04-11 16:42:50
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/address_add_controller.dart';

class AddressAddView extends GetView<AddressAddController> {
  const AddressAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('新增地址'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.only(top: ScreenAdapter.width(20)),
          children: [
            Container(
                padding: EdgeInsets.all(ScreenAdapter.width(20)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "姓名",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(46)),
                        ),
                        SizedBox(
                          width: ScreenAdapter.width(30),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                  helperStyle: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(46)),
                                  hintText: "请输入姓名",
                                  border: InputBorder.none),
                            ))
                      ],
                    ),
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "电话",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(46)),
                        ),
                        SizedBox(
                          width: ScreenAdapter.width(30),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                  helperStyle: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(46)),
                                  hintText: "请输入电话",
                                  border: InputBorder.none),
                            ))
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
