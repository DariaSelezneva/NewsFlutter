import 'package:flutter/material.dart';
import 'package:news_app/Networking/login_repository.dart';
import 'package:news_app/view/profile/password_textfield.dart';
import 'package:news_app/view/profile/email_textfield.dart';
import 'package:news_app/view/profile/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  EmailTextFormField(onChanged: (value) => _email = value),
                  SizedBox(height: 16),
                  PasswordTextFormField(onChanged: (value) => _password = value),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(onPressed: () {
                      final form = _formKey.currentState;
                      if (form != null && form.validate()) {
                        LoginRepository().login(email: _email, password: _password);
                        }
                      },
                      child: Text('Login', style: TextStyle(fontSize: 16))),
                  ),
                  SizedBox(height: 100),
                  Text("Haven't registered yet?"),
                  TextButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()
                        )
                    );
                  }, child: Text('Register', style: TextStyle(fontSize: 16)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
