/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-08 11:18:46
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-13 17:34:16
 * @Description: file content
 */
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productList/bindings/product_list_binding.dart';
import 'package:xmshop/app/modules/productList/views/product_list_view.dart';

import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
  ];
}
