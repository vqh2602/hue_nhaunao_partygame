
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/mini_games/xuc_xac_nhau/xuc_xac_nhau_controller.dart';

class XucXacNhauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<XucXacNhauController>(() => XucXacNhauController());
  }
}
