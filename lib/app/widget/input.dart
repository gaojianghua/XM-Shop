/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-21 15:47:56
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-21 15:57:02
 * @Description: file content
 */
import 'package:flutter/material.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class Input extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  const Input({super.key, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenAdapter.height(180),
      margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
      padding: EdgeInsets.only(
          left: ScreenAdapter.width(60), right: ScreenAdapter.width(70)),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(40)),
      child: TextField(
        autofocus: true,
        style: TextStyle(fontSize: ScreenAdapter.fontSize(42)),
        keyboardType: TextInputType.phone,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
        onChanged: onChanged,
      ),
    );
  }
}
