import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login_page.dart';

class SplashScreenPage extends StatelessWidget {
  static const routeName = '/splash_screen';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: Colors.white,
      imageSrc: 'assets/logo/sentra.png',
      imageSize: 100,
      text: "SENTRA",
      navigateRoute: const HomePage(),
      textStyle: const TextStyle(
        fontSize: 22.0,
        color: textPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
      duration: 500,
    );
  }
}
