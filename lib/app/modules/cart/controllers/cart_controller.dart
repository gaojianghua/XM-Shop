/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-03-13 20:04:09
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-20 15:50:33
 * @Description: file content
 */
import 'package:get/get.dart';
import 'package:xmshop/app/services/cartServices.dart';

class CartController extends GetxController {

  RxList cartList = [].obs;
  RxBool allChecked = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取购物车数据
  getCartList() async {
    var tempList = await CartServices.getCartList();
    cartList.value = tempList;
    update();
  }
  // 增加数量
  void incCartNum(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if(cartList[i]["_id"] == cartItem["_id"] && cartList[i]["selectAttr"] == cartItem["selectAttr"]) {
        cartList[i]["count"]++;
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    CartServices.setCartList(tempList);
    update();
  }
  // 减少数量
  void decCartNum(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if(cartList[i]["_id"] == cartItem["_id"] && cartList[i]["selectAttr"] == cartItem["selectAttr"]) {
        if (cartList[i]["count"] > 1) {
          cartList[i]["count"]--;
        }else{
          Get.snackbar("提示", "商品数量已达最小值！");
        }
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    CartServices.setCartList(tempList);
    update();
  }
  // 选中商品
  void checkCartItem(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if(cartList[i]["_id"] == cartItem["_id"] && cartList[i]["selectAttr"] == cartItem["selectAttr"]) {
        cartList[i]["checked"] = !cartList[i]["checked"];
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    allChecked.value = isCheckedAll();
    CartServices.setCartList(tempList);
    update();
  }
  // 全选变化
  void checkAllCartItem(value) {
    allChecked.value = value;
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      cartList[i]["checked"] = value;
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    CartServices.setCartList(tempList);
    update();
  }
  // 判断是否全选
  bool isCheckedAll() {
    if (cartList.isNotEmpty) {
      for (var i = 0; i < cartList.length; i++) {
        if (cartList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
}
