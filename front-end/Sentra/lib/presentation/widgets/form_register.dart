// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/style.dart';

class FormRegister extends StatefulWidget{
  const FormRegister({Key? key}) : super(key: key);

  @override
  State<FormRegister> createState() => _BuildFormRegister();
}

class _BuildFormRegister extends State<FormRegister> {
  final _auth = FirebaseAuth.instance;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obsecureConfirmPassword = true;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Card(
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
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                height: 50,
                child: TextFormField(
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
                    border: const  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
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
                      _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color:
                      _obscureText ? buttonPrimaryColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: _obsecureConfirmPassword,
                keyboardType: TextInputType.text,
                validator: (confirmPassword) {
                  if (confirmPassword == null || confirmPassword.isEmpty) {
                    return AppLocalizations.of(context)!.confirmPassword1;
                  } else if (confirmPassword != passwordController.text) {
                    return AppLocalizations.of(context)!.confirmPassword2;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  labelText: AppLocalizations.of(context)!.confirmPassword3,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecureConfirmPassword = !_obsecureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obsecureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color:
                      _obsecureConfirmPassword ? buttonPrimaryColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(16.0),
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      final email = emailController.text;
                      final password = passwordController.text;

                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pop(context);
                    } catch (e) {
                      final snackbar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all(buttonPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.register,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.haveAccount,
                    style: const TextStyle(
                      fontSize: 12,
                      color: textPrimaryColor,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}