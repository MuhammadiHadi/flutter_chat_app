import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/view_model/services/session_manger/session_manger.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
            query: reference,
            itemBuilder: (context, snapshot, index, animation) {
              if (SessionConttroller().userId.toString() ==
                  snapshot.child('uid').value.toString()) {
                return Container();
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/message');
                          },
                          leading:
                              snapshot.child('profile').value.toString() == ''
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.person_outline,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(snapshot
                                          .child('profile')
                                          .value
                                          .toString()),
                                    ),
                          title:
                              Text(snapshot.child('username').value.toString()),
                          subtitle:
                              Text(snapshot.child('email').value.toString()),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
