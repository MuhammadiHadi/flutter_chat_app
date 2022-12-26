import 'package:flutter/material.dart';

class SessionConttroller {
  static final SessionConttroller _session = SessionConttroller._internal();

  String? userId;
  factory SessionConttroller() {
    return _session;
  }
  SessionConttroller._internal();
}
