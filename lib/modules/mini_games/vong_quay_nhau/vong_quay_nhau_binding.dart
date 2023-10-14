
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/mini_games/vong_quay_nhau/vong_quay_nhau_controller.dart';

class VongQuayNhauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VongQuayNhauController>(() => VongQuayNhauController());
  }
}
