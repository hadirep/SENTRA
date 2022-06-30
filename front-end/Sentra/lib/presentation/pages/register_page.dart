import 'package:flutter/material.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/style.dart';
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
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: heightScreen,
        color: backgroundColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoCenter(),
                const SizedBox(height: 60),
                Container(
                  margin: const EdgeInsets.only(left: 24.0, bottom: 12.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    AppLocalizations.of(context)!.register,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24.0, right: 24.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    AppLocalizations.of(context)!.registerText,
                    style: const TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const FormRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}