import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({Key? key, required this.onChanged}) : super(key: key);

  final Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) => onChanged(text),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please enter email';
        }
        else {
          final regex = RegExp(r'^([A-Za-z0-9]+)([@]{1})([a-z]+)([.]{1})([a-z]+)$');
          if (!regex.hasMatch(text)) {
            return 'Invalid email';
          }
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Email',
      ),);
  }
}
