import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/app_state/app_state.dart';
import 'package:news_app/view/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:news_app/middleware/user_middleware.dart';

class EditPostSheet extends StatefulWidget {
  const EditPostSheet({Key? key, this.post}) : super(key: key);

  final Post? post;

  @override
  State<EditPostSheet> createState() => _EditPostSheetState();
}

class _EditPostSheetState extends State<EditPostSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (context, store) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.9,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ImagePickerView(
                          url: widget.post?.image, onSetImage: (image) => {}),
                      SizedBox(height: 12),
                      TextFormField(
                          initialValue: widget.post?.title ?? '',
                          onChanged: (text) => {widget.post?.title = text},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          )),
                      SizedBox(height: 12),
                      TextFormField(
                          maxLines: 5,
                          initialValue: widget.post?.description ?? '',
                          onChanged: (text) =>
                              {widget.post?.description = text},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Text',
                          )),
                      SizedBox(height: 12),
                      Text('Use # to create tags in text'),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: OutlinedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel'))),
                          SizedBox(width: 20),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () =>
                                      {if (widget.post == null) {
                                        store.dispatch((store) => createPost(store, ))
                                      }},
                                  child: Text('Save'))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
