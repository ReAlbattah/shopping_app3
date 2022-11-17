import 'package:get/get.dart';
import 'package:shopping_app3/logic/bindings/authBinding.dart';
import 'package:shopping_app3/logic/bindings/mainBinding.dart';
import 'package:shopping_app3/logic/bindings/productBinding.dart';
import 'package:shopping_app3/logic/controllers/productController.dart';
import 'package:shopping_app3/view/screens/auth/forgotPassword.dart';
import 'package:shopping_app3/view/screens/auth/loginScreen.dart';
import 'package:shopping_app3/view/screens/auth/signUp.dart';
import 'package:shopping_app3/view/screens/cartScreen.dart';
import 'package:shopping_app3/view/screens/categoryScreen.dart';
import 'package:shopping_app3/view/screens/mainScreen.dart';

import '../view/screens/welcomeScreen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

//getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(name: Routes.cartScreen, page: () => CartScreen(), bindings: [
      AuthBinding(),
      ProductBinding(),
    ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
