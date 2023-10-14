import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/data/models/game.dart';
import 'package:hue_nhaunao_partygame/modules/mini_games/vong_quay_nhau/vong_quay_nhau_screen.dart';
import 'package:hue_nhaunao_partygame/modules/mini_games/xuc_xac_nhau/xuc_xac_nhau_screen.dart';

List<Game> listDataGame = [
  Game(
      title: 'Vòng quay nhậu'.tr,
      description:
          'Hên xui may rủi, có chơi có chịu! Vòng quay nhậu quay 1 vòng là ngất ngây...'
              .tr,
      image: 'https://i.imgur.com/CbA8dFp.png',
      tag: ['vong_quay_nhau', 'noi_bat'],
      onTap: () {
        Get.toNamed(VongQuayNhauScreen.routeName);
      }),
  Game(
      title: 'Xúc xắc nhậu'.tr,
      description:
          'Hên xui may rủi, có chơi có chịu! Vòng quay nhậu quay 1 vòng là ngất ngây...'
              .tr,
      image: 'https://i.imgur.com/ChiwWrE.png',
      tag: ['xuc_xac_nhau', 'noi_bat'],
      onTap: () {
        Get.toNamed(XucXacNhauScreen.routeName);
      }),
  Game(
      title: 'Bảng nhân phẩm'.tr,
      description:
          'Hên xui may rủi, có chơi có chịu! Vòng quay nhậu quay 1 vòng là ngất ngây...'
              .tr,
      image: 'https://i.imgur.com/TBQcykz.png',
      tag: ['bang_nhan_pham', 'noi_bat'],
      onTap: () {}),
  Game(
      title: 'Xúc xắc lãng mạn'.tr,
      description:
          'Hên xui may rủi, có chơi có chịu! Vòng quay nhậu quay 1 vòng là ngất ngây...'
              .tr,
      image: 'https://i.imgur.com/rTrLcCg.png',
      tag: ['xuc_xac_lang_man', 'noi_bat'],
      onTap: () {}),
];
