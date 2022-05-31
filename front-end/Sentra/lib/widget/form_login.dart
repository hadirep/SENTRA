import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/pages/admin/business_management.dart';
import 'package:sentra/pages/register_page.dart';

class FormLogin extends StatefulWidget{
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _BuildFormLogin();
}

class _BuildFormLogin extends State<FormLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.all(24.0),
      elevation: 4,
      // color: Theme.of(context).primaryColor,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return value!.isEmpty
                        ? "Email harus diisi!"
                        : null;
                  },
                  decoration: const InputDecoration(
                    suffix: Icon(
                      Icons.email,
                      color: buttonPrimaryColor,
                    ),
                    labelText: 'Email ',
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return value!.isEmpty
                      ? "Password harus diisi!"
                      : null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.0))),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color:
                      _obscureText ? buttonPrimaryColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              Row(
                children:[
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(
                      fontSize: 12,
                      color: buttonPrimaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RegisterPage.routeName);
                    },
                    child: const Text(
                      'Daftar disini!',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: buttonPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, BusinessManagement.routeName);
                    // if (_formKey.currentState!.validate() &&
                    //     emailController.text.toString() == email &&
                    //     passwordController.text.toString() ==
                    //         password) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //         content: Text('Login Berhasil')),
                    //   );
                    //   Navigator.pushReplacementNamed(
                    //       context, HomePage.routeName);
                    // } else if (emailController.text.toString() !=
                    //     email ||
                    //     passwordController.text.toString() !=
                    //         password) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //         content:
                    //         Text('Email dan Password Salah!')),
                    //   );
                    // }
                  },
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all(buttonPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        )
                    ),
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}