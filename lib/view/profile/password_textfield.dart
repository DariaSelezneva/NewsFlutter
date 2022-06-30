import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({Key? key, required this.onChanged}) : super(key: key);

  final Function(String text) onChanged;

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
      onChanged: (newValue) => widget.onChanged(newValue),
      onSaved: (newValue) => widget.onChanged(newValue ?? ''),
      maxLength: 160,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        else if (value.length < 4) {
          return 'Password is too short';
        }
        else {
          final regex = RegExp(r'^([A-Za-z0-9]+)$');
          if (!regex.hasMatch(value)) {
            return 'Password can only contain letters and digits';
          }
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Password',
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
