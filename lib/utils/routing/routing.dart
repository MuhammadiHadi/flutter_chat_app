import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/route/route.dart';
import 'package:flutter_chat_app/view/login_view/login_view.dart';
import 'package:flutter_chat_app/view/signup_view/signup_view.dart';
import 'package:flutter_chat_app/view/splash_view/splash_view.dart';

class Routing {
  static Route<dynamic>? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SplashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.LoginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.SignupView:
        return MaterialPageRoute(builder: (_) => SignUpView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text("No Route Found")),
          );
        });
    }
  }
}
