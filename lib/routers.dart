import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/splash/splash_binding.dart';
import 'package:hue_nhaunao_partygame/modules/splash/splash_screen.dart';

List<GetPage> routes = [
  GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
];
