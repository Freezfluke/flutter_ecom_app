class ResponseApi {
  String message = '';
  // String error = '';
  bool success = false;
  dynamic result;
  ResponseApi({required this.message, required this.success});

  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    success = json["success"];

    try {
      result = json["result"];
    } catch (e) {
      print('ไม่พบข้อมูล $e');
    }
  }

  Map<String, dynamic> toJson() =>
      {"message": message, "success": success, "result": result};
}
