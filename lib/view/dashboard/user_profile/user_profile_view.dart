import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/res/color/color.dart';
import 'package:flutter_chat_app/res/comonent/main_button.dart';
import 'package:flutter_chat_app/view_model/profile_conttroller/profile_conttroller.dart';
import 'package:flutter_chat_app/view_model/services/session_manger/session_manger.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ref = FirebaseDatabase.instance.ref('user');
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider(
            create: (_) => ProfileConttroller(),
            child: Consumer<ProfileConttroller>(
              builder: (context, provider, child) {
                return SafeArea(
                    child: StreamBuilder(
                  stream:
                      ref.child(SessionConttroller().userId.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * .05,
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 9),
                                  child: Center(
                                    // image container
                                    child: Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        )),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 30,
                                      width: 300,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 20,
                                      width: 300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: Container(
                                      height: 30,
                                      width: 300,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 20,
                                      width: 300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: Container(
                                      height: 30,
                                      width: 300,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 20,
                                      width: 300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * .05,
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 9),
                                  child: Center(
                                    // image container
                                    child: Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.green)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: provider.image == null
                                                ? map['profile'].toString() ==
                                                        ''
                                                    ? Icon(
                                                        Icons.person_outline,
                                                        size: 50,
                                                      )
                                                    : Image.network(
                                                        map['profile'],
                                                        fit: BoxFit.cover,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingprogres) {
                                                          if (loadingprogres ==
                                                              null) {
                                                            return child;
                                                          } else {
                                                            return Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          }
                                                        },
                                                        errorBuilder: (context,
                                                            object, child) {
                                                          return Icon(
                                                            Icons.error_outline,
                                                            color: Colors.red,
                                                          );
                                                        },
                                                      )
                                                : Image.file(
                                                    File(provider.image!.path)
                                                        .absolute))),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.pickImage(context);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                    radius: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      provider.updateUsername(
                                          context, map['username']);
                                    },
                                    child: ReusebalRow(
                                      titel: "Username",
                                      icon: Icons.person_outline,
                                      value: map['username'].toString(),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      provider.updatePhone(
                                          context, map['phone']);
                                    },
                                    child: ReusebalRow(
                                      titel: "Phone",
                                      icon: Icons.phone_outlined,
                                      value: map['phone'].toString() == ''
                                          ? 'xxx-xxx-xxx'
                                          : map['phone'].toString(),
                                    ),
                                  ),
                                  ReusebalRow(
                                    titel: "Email",
                                    icon: Icons.email_outlined,
                                    value: map['email'].toString(),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  MainButton(
                                    boador: 0.0,
                                    borderColor: AppColor.greenboarder,
                                    title: "LOGOUT",
                                    color: AppColor.green,
                                    textcolor: AppColor.white,
                                    onPress: () {
                                      SessionConttroller().userId = '';

                                      final _auths = FirebaseAuth.instance;
                                      _auths.signOut().then((value) {
                                        Navigator.pushNamed(context, '/login');
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(child: Text("something want warring"));
                    }
                  },
                ));
              },
            )));
  }
}

class ReusebalRow extends StatelessWidget {
  String? titel, value;
  IconData? icon;

  ReusebalRow({this.value, this.titel, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(titel!),
        trailing: Text(value!),
      ),
    );
  }
}
