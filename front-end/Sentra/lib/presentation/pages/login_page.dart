import 'package:flutter/material.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/form_login.dart';
import 'package:sentra/presentation/widgets/logo_center.dart';

class LoginPage extends StatefulWidget{
  static const routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
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
                const ButtonBack(),
                const LogoCenter(),
                const SizedBox(height: 80),
                Container(
                  margin: const EdgeInsets.only(left: 24.0, bottom: 12.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24.0),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      AppLocalizations.of(context)!.loginText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
                const FormLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}