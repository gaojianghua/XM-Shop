import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '../../../services/keepAliveWrapper.dart';

import "../../../services/screenAdapter.dart";

import "../../../services/ityingFonts.dart";

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget _appBar() {
    return Positioned(
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
            backgroundColor:
                controller.flag.value ? Colors.white : Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code,
                    color:
                        controller.flag.value ? Colors.black87 : Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message,
                      color: controller.flag.value
                          ? Colors.black87
                          : Colors.white))
            ],
          )),
    );
  }

  Widget _focus() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(() => Swiper(
            itemCount: controller.swiperList.length,
            itemBuilder: (c, i) {
              String picUrl =
                  "https://miapp.itying.com/${controller.swiperList[i].pic}";
              return Image.network(picUrl.replaceAll("\\", "/"),
                  fit: BoxFit.fill);
            },
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            autoplay: true,
            loop: true,
          )),
    );
  }

  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assets/images/xiaomiBanner.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _banner2() {
    return Padding(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
            ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenAdapter.width(10)),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/xiaomiBanner2.png"))),
            height: ScreenAdapter.height(420)));
  }

  Widget _category() {
    return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(470),
        child: Obx(
          () => Swiper(
            itemBuilder: (context, index) {
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: ScreenAdapter.width(20),
                      mainAxisSpacing: ScreenAdapter.height(20)),
                  itemBuilder: (context, i) {
                    String picUrl =
                        "https://miapp.itying.com/${controller.categoryList[index * 10 + i].pic}";
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ScreenAdapter.height(136),
                          height: ScreenAdapter.height(136),
                          child: Image.network(picUrl.replaceAll("\\", "/"),
                              fit: BoxFit.fitHeight),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text(
                            "${controller.categoryList[index * 10 + i].title}",
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                          ),
                        )
                      ],
                    );
                  });
            },
            itemCount: controller.categoryList.length ~/ 10,
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints.expand(height: ScreenAdapter.height(20)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              activeColor: Colors.black54,
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
          ),
        ));
  }

  // 热销
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30),
              ScreenAdapter.height(20), ScreenAdapter.width(30), 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "热销臻选",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(46)),
              ),
              Text(
                "更多手机 >",
                style: TextStyle(fontSize: ScreenAdapter.fontSize(38)),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,
              ScreenAdapter.width(20), ScreenAdapter.height(20)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: ScreenAdapter.height(738),
                  child: Text("1"),
                )
              ),
              SizedBox(
                width: ScreenAdapter.width(20),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: ScreenAdapter.height(738),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("2")
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("2")
                              )
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("2")
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _homePage() {
    return Positioned(
        top: -60,
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(
          controller: controller.scrollController,
          children: [
            _focus(),
            _banner(),
            _category(),
            _banner2(),
            _bestSelling()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
      body: Stack(
        children: [_homePage(), _appBar()],
      ),
    ));
  }
}
