/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-14 16:14:42
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-14 17:44:26
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/searchs_controller.dart';

class SearchView extends GetView<SearchsController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
          title: Container(
            width: ScreenAdapter.width(800),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              cursorHeight: ScreenAdapter.height(46),
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {}, child: const Text("搜索", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                )))
          ]),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "搜索历史",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(42)
                ),
              ),
              const Icon(Icons.delete_forever_outlined)
            ],
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdapter.height(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text("手机"),
              )
            ],
          )
        ],
      ),
    );
  }
}
