import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '../../../services/keepAliveWrapper.dart';

import "../../../services/screenAdapter.dart";

import "../../../services/ityingFonts.dart";

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -60,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView.builder(
                  controller: controller.scrollController, //绑定controller
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(
                        width: ScreenAdapter.width(1080),
                        height: ScreenAdapter.height(682),
                        child: Image.network(
                          "https://www.itying.com/images/focus/focus02.png",
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return ListTile(title: Text("第$index个列表"));
                    }
                  })),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(() => AppBar(
                  leading: controller.flag.value
                      ? const Text("")
                      : const Icon(
                          ItyingFonts.xiaomi,
                          color: Colors.white,
                        ),
                  leadingWidth: controller.flag.value
                      ? ScreenAdapter.width(40)
                      : ScreenAdapter.width(140),
                  title: AnimatedContainer(
                    width: controller.flag.value
                        ? ScreenAdapter.width(800)
                        : ScreenAdapter.width(620),
                    height: ScreenAdapter.height(96),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(230, 252, 243, 236),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    duration: const Duration(milliseconds: 600),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34),
                              0, ScreenAdapter.width(10), 0),
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
                  backgroundColor:
                      controller.flag.value ? Colors.white : Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code,
                          color: controller.flag.value
                              ? Colors.black87
                              : Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.message,
                            color: controller.flag.value
                                ? Colors.black87
                                : Colors.white))
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
