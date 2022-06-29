import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.onSave}) : super(key: key);

  final Function(String text) onSave;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _passwordInVisible,
      onChanged: (newValue) => widget.onSave(newValue),
      onSaved: (newValue) => widget.onSave(newValue ?? ''),
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
