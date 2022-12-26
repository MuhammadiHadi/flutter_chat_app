import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocus(
      BuildContext context, FocusNode currentfocus, FocusNode nextfocus) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Colors.black,
    );
  }
}
