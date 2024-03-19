/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-19 11:55:02
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-19 14:04:16
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class CartItemNumberView extends GetView {
  const CartItemNumberView({Key? key}) : super(key: key);

  Widget _left() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(70),
      child: Text(
        "-",
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(42)
        ),
      ),
    );
  }

  Widget _center() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(70),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
          right: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12)
        )
      ),
      child: const Text("0"),
    );
  }

  Widget _right() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(70),
      child: Text(
        "+",
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(42)
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(70),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          width: ScreenAdapter.width(2),
          color: Colors.black12
        )
      ),
      child: Row(
        children: [
          _left(),
          _center(),
          _right()
        ],
      ),
    );
  }
}
