import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  String? title;
  Color? color, textcolor, borderColor;
  VoidCallback? onPress;
  bool loading;
  double boador;

  MainButton(
      {this.color,
      this.title,
      this.loading = false,
      this.onPress,
      this.textcolor,
      this.borderColor,
      required this.boador});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor!, width: boador.toDouble()),
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
