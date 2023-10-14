import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hue_nhaunao_partygame/data/models/minigame.dart';

class XucXacNhauController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  GetStorage box = GetStorage();
  var arguments = Get.arguments;
  List<MiniGame> listDataMiniGame = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    setDataGame();
    changeUI();
  }

  setDataGame() {
    listDataMiniGame = [
      MiniGame(
        title: 'Nhấp môi'.tr,
        image: 'assets/images/x1.png',
        description: 'Bạn uống, nhấp môi thôi.'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'Uống tùy thích'.tr,
        image: 'assets/images/x2.png',
        description: 'Bạn uống, uống tùy thích, bao nhiêu cũng được'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'X2 niềm vui'.tr,
        image: 'assets/images/x3.png',
        description:
            'Bạn tung thêm 1 lượt nữa, lần thứ 2 tung gấp đôi hiệu quả'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'Uống 2 ly'.tr,
        image: 'assets/images/x4.png',
        description: 'Bạn uống, nhưng mà 2 ly.'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'Uống cùng chiến hữu'.tr,
        image: 'assets/images/x5.png',
        description: 'Bạn uống, và chọn 1 người bạn thân uống cùng bạn.'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'Chỉ định'.tr,
        image: 'assets/images/x6.png',
        description: 'Bạn chỉ ai, người đó uống.'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'Tất cả cạn ly'.tr,
        image: 'assets/images/x7.png',
        description: 'Tất cả cạn ly'.tr,
        tag: ['xuc_xac_nhau'],
      ),
      MiniGame(
        title: 'Uống nửa ly'.tr,
        image: 'assets/images/x8.png',
        description: 'Bạn uống, nhưng mà nửa ly thôi.'.tr,
        tag: ['xuc_xac_nhau'],
      )
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
