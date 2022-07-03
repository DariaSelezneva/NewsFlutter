import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/app_state/app_state.dart';
import 'package:news_app/view/image_picker.dart';
import 'package:news_app/view/profile/email_textfield.dart';
import 'package:news_app/view/profile/password_textfield.dart';
import 'package:redux/redux.dart';
import 'package:news_app/middleware/user_middleware.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  File? _imageFile;
  String _email = '';
  String _name = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (context, store) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Registration'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImagePickerView(
                          onSetImage: (image) => _imageFile = image),
                      EmailTextFormField(onChanged: (value) => _email = value),
                      SizedBox(height: 16),
                      TextFormField(
                          onChanged: (value) => _name = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Name',
                          )),
                      SizedBox(height: 16),
                      PasswordTextFormField(
                          title: 'Password',
                          onChanged: (value) => _password = value),
                      PasswordTextFormField(
                          title: 'Confirm Password',
                          onChanged: (value) => _confirmPassword = value),
                      SizedBox(height: 40),
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                          child:
                              Text('Register', style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              if (_password != _confirmPassword) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text("Password doesn't match confirmation"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      )
                                    ]
                                  )
                                );
                              }
                              else {
                                store.dispatch((store) =>
                                    register(store, _imageFile, _email, _name, _password));
                                Navigator.pop(context);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
