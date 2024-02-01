import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;


  const MyTextField({super.key, required this.obscureText, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller:controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
