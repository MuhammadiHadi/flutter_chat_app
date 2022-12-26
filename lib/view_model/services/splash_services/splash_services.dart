import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/view_model/services/session_manger/session_manger.dart';

class SplashServices {
  void SplashTimer(BuildContext context) {
    final _auths = FirebaseAuth.instance;

    final user = _auths.currentUser;
    if (user != null) {
      SessionConttroller().userId = user.uid.toString();
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, '/navigation');
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, '/login');
      });
    }
  }
}
