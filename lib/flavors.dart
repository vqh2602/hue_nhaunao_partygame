enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Huệ Nhậu Nào! (dev)';
      case Flavor.prod:
        return 'Huệ Nhậu Nào!';
      default:
        return 'title';
    }
  }

}
