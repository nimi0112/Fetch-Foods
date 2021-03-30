import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static Future<void> hideKeyBoard() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static Future<void> hideKeyBoardWithUnfocus(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
