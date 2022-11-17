import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
  required this.text,
  required this.onPressed,
  super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode? pinkClr :mainColor ,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        underLine: TextDecoration.none,
      ),
    );
  }
}
