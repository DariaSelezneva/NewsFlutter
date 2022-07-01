import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/networking/register_repository.dart';
import 'package:news_app/networking/upload_repository.dart';
import 'package:news_app/view/image_picker.dart';
import 'package:news_app/view/profile/email_textfield.dart';
import 'package:news_app/view/profile/password_textfield.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePickerView(onSetImage: (image) => _imageFile = image),
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
                  )
                ),
                SizedBox(height: 16),
                PasswordTextFormField(
                    title: 'Password',
                    onChanged: (value) => _password = value),
                PasswordTextFormField(
                    title: 'Confirm Password',
                    onChanged: (value) => {},
                    shouldMatchString: _password),
                SizedBox(height: 40),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      if (_imageFile != null) {
                        UploadRepository()
                            .upload(image: _imageFile!)
                            .then((avatar) =>
                            RegisterRepository().register(avatar: avatar,
                                email: _email,
                                name: _name,
                                password: _password)
                                .then((authResponse) => FlutterSecureStorage().write(key: 'token', value: authResponse.token)));
                      }
                    }
                  },
                      child: Text('Register', style: TextStyle(fontSize: 16))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
