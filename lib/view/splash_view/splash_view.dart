import 'package:flutter/material.dart';
import 'package:flutter_chat_app/view_model/services/splash_services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices _services = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _services.SplashTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash View")),
    );
  }
}
