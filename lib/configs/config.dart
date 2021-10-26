enum Flavor {
  DEVELOP,
  STAGING,
  RELEASE,
}

class Config {
  static Flavor? environment;

  static String getString() {
    switch (environment) {
      case Flavor.DEVELOP:
        return "DEVELOP";
      case Flavor.STAGING:
        return "STAGING";
      case Flavor.RELEASE:
        return "RELEASE";
      default:
        return "環境エラー";
    }
  }
}
