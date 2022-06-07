import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/form_register.dart';
import 'package:sentra/presentation/widgets/logo_center.dart';

class RegisterPage extends StatefulWidget{
  static const routeName = '/register-page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0, bottom: 12.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Register  ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: secondaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0, right: 24.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Ayo! berbagi keunikan seni tradisional kita dengan dunia mulai sekarang!',
                style: TextStyle(
                  fontSize: 12,
                  color: secondaryColor,
                ),
              ),
            ),
            const FormRegister(),
          ],
        ),
      ),
    );
  }
}