import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/authController.dart';
import 'package:shopping_app3/utils/myString.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

import '../../../routes/routes.dart';
import '../../widgets/auth/authButton.dart';
import '../../widgets/auth/authTextFormField.dart';
import '../../widgets/auth/checkWidget.dart';
import '../../widgets/auth/containerUnder.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white ,
        elevation: 0,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: 'SIGN',
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            underLine: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: 'UP',
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                           ? Icon(
                                Icons.person,
                                color: pinkClr,
                                size: 30,
                              )
                             : Image.asset('assets/images/user.png'),
                            
                        suffixIcon: const Text(''),
                        hintText: 'User Name ',
                      ),
                      const SizedBox(
                        height: 20,
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
                              ): Image.asset('assets/images/email.png')
                            ,
                        suffixIcon: const Text(''),
                        hintText: 'Email ',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be more than 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                  : Image.asset('assets/images/lock.png')
                                ,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibilty();
                              },
                              icon: controller.isVisibilty
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: 'Password ',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          text: 'Sign Up',
                          onPressed: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar(
                                '',
                                'Plaese accept the terms & conditions',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red[400],
                                colorText: Colors.white,
                              );
                            } else if (formKey.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String password = passwordController.text;

                              controller.signUpUsingFirebase(
                                name: name,
                                email: email,
                                password: password,
                              );

                              controller.isCheckBox = true;
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: 'Already have an account?',
              textType: 'Log in ',
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
