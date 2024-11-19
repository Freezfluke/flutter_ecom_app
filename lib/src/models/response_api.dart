import 'package:first_app/src/utils/my_logs.dart';

class ResponseApi {
  String message = '';
  bool success = false;
  dynamic result;
  ResponseApi({required this.message, required this.success});
  final MyLogs _myLogs = MyLogs();

  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json["success"];
    try {
      result = json["result"];
    } catch (e) {
      _myLogs.log('$e');
    }
  }

  Map<String, dynamic> toJson() =>
      {"message": message, "success": success, "result": result};
}
