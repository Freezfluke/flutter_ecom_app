import 'dart:async';

import 'package:flutter/foundation.dart';

class MyTimmer {
  void durationTimmer({required VoidCallback callbackFunction}) {
    Timer(const Duration(seconds: 1), () {
      callbackFunction();
    });
  }
}
