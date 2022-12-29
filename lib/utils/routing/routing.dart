import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utils/route/route.dart';
import 'package:flutter_chat_app/view/dashboard/message_view/message_view.dart';
import 'package:flutter_chat_app/view/dashboard/navigationbar_view/navigation_bar_view.dart';
import 'package:flutter_chat_app/view/dashboard/user_list_view/user_list_view.dart';
import 'package:flutter_chat_app/view/forget_password/forget_password.dart';
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
      case Routes.ForgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case Routes.NavigationBarView:
        return MaterialPageRoute(builder: (_) => NavigationBarView());
      case Routes.UserListView:
        return MaterialPageRoute(builder: (_) => UserList());
      case Routes.MessageView:
        return MaterialPageRoute(builder: (_) => MessageView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text("No Route Found")),
          );
        });
    }
  }
}
