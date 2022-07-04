import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/redux/app_state/app_state.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:news_app/redux/middleware/post_actions_middleware.dart';

class EditPostSheet extends StatefulWidget {
  const EditPostSheet({Key? key, this.post, required this.user}) : super(key: key);

  final Post? post;
  final User user;

  @override
  State<EditPostSheet> createState() => _EditPostSheetState();
}

class _EditPostSheetState extends State<EditPostSheet> {
  final _formKey = GlobalKey<FormState>();

  File? _image;
  String _title = '';
  String _description = '';

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
                              url: widget.post?.image, onSetImage: (image) => _image = image),
                          SizedBox(height: 12),
                          TextFormField(
                              initialValue: widget.post?.title ?? '',
                              onChanged: (text) {
                                _title = text;
                                widget.post?.title = text;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Title',
                              )),
                          SizedBox(height: 12),
                          TextFormField(
                              maxLines: 5,
                              initialValue: widget.post?.description ?? '',
                              onChanged: (text) {
                                _description = text;
                                widget.post?.description = text;
                                },
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
                                      onPressed: () {
                                        final regex = RegExp('#[A-Za-z0-9]+');
                                        final tags = regex.allMatches(_description)
                                            .map((e) => e.group(0).toString().substring(1))
                                            .toList();
                                        if (widget.post == null) {
                                            store.dispatch((store) => createPost(
                                                store,
                                                widget.user,
                                                _image,
                                                _title,
                                                _description,
                                                tags));
                                          }
                                        else {
                                          store.dispatch((store) => updatePost(
                                              store,
                                              widget.user,
                                              widget.post!.id,
                                              _image,
                                              widget.post!.image,
                                              widget.post!.title,
                                              widget.post!.description,
                                              tags));
                                        }
                                        Navigator.pop(context);
                                        },
                                      child: Text('Save'))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                if (widget.post != null) Padding(
                  padding: const EdgeInsets.all(40),
                  child: SizedBox(
                    width: MediaQuery.of(context).copyWith().size.width,
                    child: OutlinedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Do you want to delete this post?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  store.dispatch((store) => deletePost(store, widget.post!.id));
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('Delete', style: TextStyle(
                                    color: Colors.red
                                ),),
                              ),
                            ],
                          ),
                        ),
                        child: Text('Delete post'),
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
