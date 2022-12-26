import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/utils/utils.dart';

class ForgetPasswordConttroller with ChangeNotifier {
  final _auths = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forgetPassword(
    BuildContext context,
    String email,
  ) {
    setLoading(true);
    try {
      _auths.sendPasswordResetEmail(email: email).then((value) {
        setLoading(false);
        Utils.toastMessage("Please check your Email");
        Navigator.pushNamed(context, '/login');
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
