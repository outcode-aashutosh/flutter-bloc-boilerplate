class AppConfig {
  static String baseUrl = 'xyz.com';
  static String endPoint = '/api/v1/';

  static const String defaultLocale = 'en';

  static void configDev() {
    baseUrl = baseUrl;
  }

  static void configProduction() {
    baseUrl = baseUrl;
  }
}
