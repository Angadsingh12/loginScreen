import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  const MyButton({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
          ),
          width: double.infinity,
          height: 60,

        child: Center(
          child: Text(buttonText,style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),),
        ),
        ),
      ),
    );
  }
}
