import 'package:flutter/material.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/image_picker.dart';

class EditUserSheet extends StatefulWidget {
  const EditUserSheet({
    Key? key,
    required this.user}) : super(key: key);

  final User user;

  @override
  State<EditUserSheet> createState() => _EditUserSheetState();
}

class _EditUserSheetState extends State<EditUserSheet> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height * 0.9,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ImagePickerView(
                        url: widget.user.avatar,
                        onSetImage: (image) => {}),
                    SizedBox(height: 12),
                    TextFormField(
                        initialValue: widget.user.name,
                        onChanged: (text) => { widget.user.name = text },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        )
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                        initialValue: widget.user.email,
                        onChanged: (text) => { widget.user.email = text },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        )
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), child: Text('Cancel'))),
                        SizedBox(width: 20),
                        Expanded(child: ElevatedButton(onPressed: () => {}, child: Text('Save'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              width: MediaQuery.of(context).copyWith().size.width,
              child: OutlinedButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Do you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Log out'),
                          child: const Text('Log out', style: TextStyle(
                              color: Colors.red
                          ),),
                        ),
                      ],
                    ),
                  ),
                  child: Text('Log out'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                      side: MaterialStateProperty.all(BorderSide(color: Colors.red, width: 2.0))
                  )),
            ),
          )
        ],
      ),
    );
  }
}