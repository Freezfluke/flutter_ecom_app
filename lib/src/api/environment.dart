class Environment {
  static const String apiEcom = "127.0.0.1:5555";
  static const String apiVersion = "/api/v1";
  static const String protocol = "http://";

  static const String url = '$protocol$apiEcom$apiVersion';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Connection': 'keep-alive',
  };
}
