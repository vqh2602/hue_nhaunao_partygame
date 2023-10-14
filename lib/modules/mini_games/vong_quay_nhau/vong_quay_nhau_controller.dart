import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hue_nhaunao_partygame/data/models/minigame.dart';

class VongQuayNhauController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  GetStorage box = GetStorage();
  List<MiniGame> listDataMiniGame = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    setData();
    changeUI();
  }

  setData() {
    listDataMiniGame = [
      MiniGame(
          title: 'Nam uống 100%'.tr,
          image: 'assets/images/v1.png',
          description: 'Tất cả nam trong bàn nhậu uống 100%'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Nữ uống 100%'.tr,
          image: 'assets/images/v2.png',
          description: 'Tất cả nữ trong bàn nhậu uống 100%'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Bên phải uống 50%'.tr,
          image: 'assets/images/v3.png',
          description: 'Người kế bân phải bạn uống 50%'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Bên phải uống 50%'.tr,
          image: 'assets/images/v4.png',
          description: 'Người kế bân trái bạn uống 50%'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Bên phải uống 100%'.tr,
          image: 'assets/images/v5.png',
          description: 'Bạn uống 100%'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Tất cả uống 100%'.tr,
          image: 'assets/images/v6.png',
          description: 'Tất cả ở trong bàn nhậu uống 100%'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Bạn uống 50% + 1 lượt'.tr,
          image: 'assets/images/v7.png',
          description: 'Bạn uống 50% + thêm 1 lượt quay'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Qua lượt'.tr,
          image: 'assets/images/v8.png',
          description: 'Bạn không phải làm gỉ cả, lượt bạn đã qua.'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Tất cả 50% trừ bạn'.tr,
          image: 'assets/images/v9.png',
          description: 'Tất cả người trên bàn nhậu uống 50% trừ bạn ra.'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Chỉ định 100%'.tr,
          image: 'assets/images/v10.png',
          description: 'Bạn chỉ định ai là người phải uống 100%.'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Cùng màu quần áo với bạn 100%'.tr,
          image: 'assets/images/v11.png',
          description:
              'Nhưng ai cùng màu quần áo với bạn uống 100% có cả bạn.'.tr,
          tag: ['vong_quay_nhau']),
      MiniGame(
          title: 'Đồng khởi zô!'.tr,
          image: 'assets/images/v12.png',
          description:
              'Tất cả cùng uống, uống báo nhiêu do người đồng khởi(bạn) quyết định.'
                  .tr,
          tag: ['vong_quay_nhau']),
    ];
    listDataMiniGame.shuffle();
    updateUI();
  }

  changeUI() {
    change(null, status: RxStatus.success());
  }

  updateUI() {
    update();
  }

  loadingUI() {
    change(null, status: RxStatus.loading());
  }
}
