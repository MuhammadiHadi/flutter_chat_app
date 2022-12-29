import 'package:flutter/material.dart';
import 'package:flutter_chat_app/view/dashboard/message_view/message_view.dart';
import 'package:flutter_chat_app/view/dashboard/user_profile/user_profile_view.dart';

import '../user_list_view/user_list_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  @override
  List<Widget> Screen = [
    UserList(),
    MessageView(),
    ProfileView(),
  ];
  int currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "chat",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
