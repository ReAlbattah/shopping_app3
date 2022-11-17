import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/authController.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/auth/authButton.dart';

import '../../../utils/myString.dart';
import '../../widgets/auth/authTextFormField.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Get.isDarkMode ? pinkClr : mainColor),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(Icons.arrow_back,
        //       color: Get.isDarkMode ? Colors.black : Colors.white),
        // ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'If you want to recover your account, then please provide your email ID below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextFormField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode
                      ? Icon(
                          Icons.email,
                          color: pinkClr,
                          size: 30,
                        )
                      : Image.asset('assets/images/email.png'),
                  suffixIcon: const Text(''),
                  hintText: 'Email ',
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    text: 'SEND',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text;
                        controller.resetPassword(email.trim());
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
