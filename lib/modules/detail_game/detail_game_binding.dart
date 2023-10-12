import 'package:hue_nhaunao_partygame/modules/detail_game/detail_game_controller.dart';
import 'package:get/get.dart';

class DetailGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGameController>(() => DetailGameController());
  }
}
