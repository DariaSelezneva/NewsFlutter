import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/app_state/app_state.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:news_app/middleware/user_middleware.dart';

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
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (context, store) {
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
                              onSetImage: (image) => _imageFile = image),
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
                              Expanded(child: ElevatedButton(onPressed: () {
                                store.dispatch(
                                      (store) => updateUser(store, _imageFile, widget.user.avatar, widget.user.email, widget.user.name));
                                Navigator.pop(context);
                              },
                                  child: Text('Save'))),
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
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  store.dispatch(logout);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  },
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
    });
  }
}
