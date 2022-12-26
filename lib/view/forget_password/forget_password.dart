import 'package:flutter/material.dart';
import 'package:flutter_chat_app/res/color/color.dart';
import 'package:flutter_chat_app/res/comonent/input_text_feild.dart';
import 'package:flutter_chat_app/res/comonent/main_button.dart';
import 'package:flutter_chat_app/view_model/forget_password_conttroller/forget_password_conttroller.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();

  final emailfocusnode = FocusNode();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final style = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 23,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    "Forget Password",
                    style: style,
                  ),
                ),
                Text(
                  "Enter your email address\n to reset your password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * .05,
                ),
                Form(
                    key: _key,
                    child: Column(
                      children: [
                        InputTextField(
                          hint: "Email",
                          obscureText: false,
                          iconData: Icons.email_outlined,
                          focusNode: emailfocusnode,
                          keyboardType: TextInputType.emailAddress,
                          formFieldValidator: (value) {
                            return value.isEmpty ? "Enter valide email" : null;
                          },
                          controller: _emailController,
                        ),
                      ],
                    )),
                SizedBox(
                  height: height * 0.03,
                ),
                ChangeNotifierProvider(
                  create: (_) => ForgetPasswordConttroller(),
                  child: Consumer<ForgetPasswordConttroller>(
                    builder: (context, provider, child) {
                      return MainButton(
                        title: "RESET",
                        color: AppColor.green,
                        textcolor: AppColor.white,
                        loading: provider.loading,
                        onPress: () {
                          if (_key.currentState!.validate()) {
                            provider.forgetPassword(
                                context, _emailController.text);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("Back"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
