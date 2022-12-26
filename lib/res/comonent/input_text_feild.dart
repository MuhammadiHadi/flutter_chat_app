import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  String? hint;
  IconData? iconData, righticon;
  TextEditingController? controller;
  FocusNode? focusNode;
  FormFieldValidator? formFieldValidator;
  FormFieldSetter? fieldSetter;
  bool? obscureText;
  bool? enable, autofocus;
  TextInputType? keyboardType;

  InputTextField(
      {this.hint,
      this.iconData,
      this.righticon,
      this.fieldSetter,
      this.formFieldValidator,
      this.focusNode,
      this.controller,
      this.autofocus,
      this.enable,
      this.obscureText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText!,
        keyboardType: keyboardType,
        onFieldSubmitted: fieldSetter,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(5),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(
            iconData,
          ),
          suffixIcon: Icon(
            righticon,
            color: Colors.black,
          ),
        ),
        validator: formFieldValidator,
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }
}
