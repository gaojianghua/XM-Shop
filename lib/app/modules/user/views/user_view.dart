/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-08 11:27:05
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-20 18:00:08
 * @Description: file content
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Row(
            children: [
              Text("会员码"),
              IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message))
            ],
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        children: [
          SizedBox(
            child: Row(
              children: [
                SizedBox(width: ScreenAdapter.width(40)),
                SizedBox(
                  height: ScreenAdapter.height(150),
                  width: ScreenAdapter.height(150),
                  child: CircleAvatar(
                    radius: ScreenAdapter.width(75),
                    backgroundImage: const AssetImage("assets/images/user.png"),
                  ),
                ),
                SizedBox(width: ScreenAdapter.width(40)),
                Text(
                  "登录/注册",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(46)
                  ),
                ),
                SizedBox(width: ScreenAdapter.width(40)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: ScreenAdapter.fontSize(34),
                  color: Colors.black54,
                )
              ],
            ),
          ),
          Container(
            height: ScreenAdapter.height(200),
            margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "-",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(80),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "米金",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black45
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "-",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(80),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "优惠券",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black45
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "-",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(80),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "红包",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black45
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "-",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(80),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "最高额度",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black45
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.bookmarks_outlined),
                      Text(
                        "钱包",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black45
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // 广告牌
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
            child: Container(
              width: ScreenAdapter.width(1008),
              height: ScreenAdapter.height(300),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/user_ad1.png"),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(ScreenAdapter.width(20))
              ),
            ),
          ),
          // 菜单
          Container(
            child: Column(
              children: [
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
