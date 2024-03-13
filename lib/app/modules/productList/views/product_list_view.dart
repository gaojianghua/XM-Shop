/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-13 18:32:02
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-14 00:17:21
 * @Description: file content
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  Widget _productList() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(26), ScreenAdapter.height(140),
          ScreenAdapter.width(26), ScreenAdapter.height(10)),
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(60)),
                  width: ScreenAdapter.width(400),
                  height: ScreenAdapter.height(460),
                  child: Image.network("src", fit: BoxFit.fitHeight)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                      child: Text(
                        "Redmi Note 11",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(42),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                      child: Text(
                        "Redmi重新上传上厕所|Note大是的撒|大沙雕11",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "￥3888",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(38),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _subHeader() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: ScreenAdapter.height(2),
              color: const Color.fromRGBO(233, 233, 233, 0.9)
            )
          )
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text(
                    "综合",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenAdapter.fontSize(32)
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text(
                    "销量",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenAdapter.fontSize(32)
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text(
                    "价格",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenAdapter.fontSize(32)
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text(
                    "筛选",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenAdapter.fontSize(32)
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          title: Container(
            width: ScreenAdapter.width(900),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                  child: const Icon(Icons.search),
                ),
                Text("手机",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenAdapter.fontSize(32)))
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [_productList(), _subHeader()],
        ));
  }
}
