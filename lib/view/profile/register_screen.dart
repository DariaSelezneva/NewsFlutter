import 'package:flutter/material.dart';
import 'package:news_app/view/profile/password_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),),
                SizedBox(height: 16),
                PasswordTextField(onSave: (text) => print(text)),
                SizedBox(height: 40),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(onPressed: () => print('pressed'),
                      child: Text('Register', style: TextStyle(fontSize: 16))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
