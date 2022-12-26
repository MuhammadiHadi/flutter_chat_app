import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  String? title;
  Color? color, textcolor;
  VoidCallback? onPress;
  bool loading;

  MainButton(
      {this.color,
      this.title,
      this.loading = false,
      this.onPress,
      this.textcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Center(
                child: Text(
                title!,
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.w600,
                ),
              )),
      ),
    );
  }
}
