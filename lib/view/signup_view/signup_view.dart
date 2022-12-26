import 'package:flutter/material.dart';
import 'package:flutter_chat_app/res/color/color.dart';
import 'package:flutter_chat_app/res/comonent/input_text_feild.dart';
import 'package:flutter_chat_app/res/comonent/main_button.dart';
import 'package:flutter_chat_app/utils/utils/utils.dart';
import 'package:flutter_chat_app/view_model/signup_conttroller/signup_conttroller.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  final userNamefocusnode = FocusNode();

  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  // @override
  // void initState() {
  //
  //
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _userNameController.dispose();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    String? fonteight;
    String fontsize;

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
            child: ChangeNotifierProvider(
              create: (_) => SignupController(),
              child: Consumer<SignupController>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Text(
                            "Welcome to Messaging",
                            style: style,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter your email address\n to register your account",
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
                                  hint: "User Name",
                                  obscureText: false,
                                  iconData: Icons.person_outline,
                                  focusNode: userNamefocusnode,
                                  keyboardType: TextInputType.text,
                                  fieldSetter: (value) {
                                    Utils.fieldFocus(context, userNamefocusnode,
                                        emailfocusnode);
                                  },
                                  formFieldValidator: (value) {
                                    return value.isEmpty ? "Enter Name" : null;
                                  },
                                  controller: _userNameController,
                                ),
                                InputTextField(
                                  hint: "Email",
                                  obscureText: false,
                                  iconData: Icons.email_outlined,
                                  focusNode: emailfocusnode,
                                  keyboardType: TextInputType.emailAddress,
                                  fieldSetter: (value) {
                                    Utils.fieldFocus(context, emailfocusnode,
                                        passwordfocusnode);
                                  },
                                  formFieldValidator: (value) {
                                    return value.isEmpty ? "Enter Email" : null;
                                  },
                                  controller: _emailController,
                                ),
                                InputTextField(
                                  hint: "Password",
                                  iconData: Icons.lock_outline,
                                  obscureText: true,
                                  focusNode: passwordfocusnode,
                                  formFieldValidator: (value) {
                                    return value.isEmpty
                                        ? "Enter valida password"
                                        : null;
                                  },
                                  controller: _passwordController,
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                MainButton(
                                  title: "LOGIN",
                                  color: AppColor.green,
                                  textcolor: AppColor.white,
                                  loading: provider.loading,
                                  onPress: () {
                                    if (_key.currentState!.validate()) {
                                      provider.sigup(
                                          context,
                                          _userNameController.text,
                                          _emailController.text,
                                          _passwordController.text);
                                    }
                                  },
                                ),
                              ],
                            )),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text.rich(
                            TextSpan(
                                text: "Already have an account?",
                                children: [
                                  TextSpan(
                                      text: " Sign_in",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 15))
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}
