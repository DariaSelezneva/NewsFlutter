import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({Key? key, required this.title, required this.onChanged, this.shouldMatchString}) : super(key: key);

  final String title;
  final Function(String text) onChanged;
  final String? shouldMatchString;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {

  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: _passwordInVisible,
      onChanged: (text) => widget.onChanged(text),
      maxLength: 160,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please enter password';
        }
        else if (text.length < 4) {
          return 'Password is too short';
        }
        else if (widget.shouldMatchString != null && text != widget.shouldMatchString) {
          return "Password doesn't match confirmation";
        }
        else {
          final regex = RegExp(r'^([A-Za-z0-9]+)$');
          if (!regex.hasMatch(text)) {
            return 'Password can only contain letters and digits';
          }
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: widget.title,
        suffixIcon: IconButton(
          icon: Icon(
            _passwordInVisible ? Icons.visibility_off : Icons.visibility, //change icon based on boolean value
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordInVisible = !_passwordInVisible; //change boolean value
            });
          },
        ),
      ),);
  }
}
