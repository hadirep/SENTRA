// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/style.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/pages/register_page.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _BuildFormLogin();
}

class _BuildFormLogin extends State<FormLogin> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  // ignore: unused_field
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.all(24.0),
      elevation: 4,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return value!.isEmpty
                      ? AppLocalizations.of(context)!.validateEmail
                      : null;
                },
                decoration: InputDecoration(
                  suffix: const Icon(
                    Icons.email,
                    color: buttonPrimaryColor,
                  ),
                  labelText: AppLocalizations.of(context)!.artEmail,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return value!.isEmpty
                      ? AppLocalizations.of(context)!.validatePassword
                      : null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: _obscureText ? buttonPrimaryColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              Row(
                children:[
                  Text(
                    AppLocalizations.of(context)!.noAccount,
                    style: const TextStyle(
                      fontSize: 12,
                      color: buttonPrimaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context, RegisterPage.routeName,
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.registerHere,
                      style: const TextStyle(
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
                  onPressed: () async {
                    try {
                      final email = emailController.text;
                      final password = passwordController.text;

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        const snackbar =
                            SnackBar(content: Text('Login Berhasil'));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);

                        Navigator.pushReplacementNamed(
                          context,
                          BusinessManagement.routeName,
                        );
                      }
                    } catch (e) {
                      const snack = SnackBar(
                          content:
                              Text('Login Gagal, Username & Password Salah!'));
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(buttonPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: const TextStyle(
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
