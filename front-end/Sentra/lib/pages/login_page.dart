import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/widget/button/button_back.dart';
import 'package:sentra/widget/form_login.dart';
import 'package:sentra/widget/logo_center.dart';

class LoginPage extends StatefulWidget{
  static const routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ButtonBack(),
            const LogoCenter(),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0, bottom: 12.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Login  ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: secondaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Ayo! kita kenalkan lebih banyak tentang seni tradisional nusantara',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
            ),
            FormLogin(),
          ],
        ),
      ),
    );
  }
}

