class BaseUrl {
  static const String base = "http://172.20.10.8:5000";

  static const String predictUrl = "$base/predict";
  static String history({required String userId}) => "$base/history/$userId";
}
