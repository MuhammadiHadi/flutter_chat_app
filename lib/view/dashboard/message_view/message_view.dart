import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  final String? name;

  MessageView({this.name});
  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  TextEditingController messageConttroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString() == ''
            ? "new message"
            : widget.name.toString()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Text([index].toString());
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter Message",
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ),
                controller: messageConttroller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
