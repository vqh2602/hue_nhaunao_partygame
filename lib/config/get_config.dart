import 'dart:developer';

import 'package:hue_nhaunao_partygame/config/config.dart';
import 'package:hue_nhaunao_partygame/flavors.dart';
import 'package:hue_nhaunao_partygame/config/config_dev.dart' as dev;
import 'package:hue_nhaunao_partygame/config/config_prod.dart' as prod;

Future<ModuleConfig> getConfigBase() async {
  log('moi truong: ${F.name}');
  switch (F.appFlavor) {
    case Flavor.dev:
      return dev.Environment();
    case Flavor.prod:
      return prod.Environment();
    default:
      return dev.Environment();
  }
}
