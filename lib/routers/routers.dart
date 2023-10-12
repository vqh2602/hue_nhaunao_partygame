import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/detail_game/detail_game_binding.dart';
import 'package:hue_nhaunao_partygame/modules/detail_game/detail_game_screen.dart';
import 'package:hue_nhaunao_partygame/modules/home/home_binding.dart';
import 'package:hue_nhaunao_partygame/modules/home/home_screen.dart';
import 'package:hue_nhaunao_partygame/modules/splash/splash_binding.dart';
import 'package:hue_nhaunao_partygame/modules/splash/splash_screen.dart';

List<GetPage> routes = [
  GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
  GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding()),
        GetPage(
      name: DetailGameScreen.routeName,
      page: () => const DetailGameScreen(),
      binding: DetailGameBinding()),
];
