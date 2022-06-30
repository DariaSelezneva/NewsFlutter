import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({Key? key, this.url, required this.onSetImage}) : super(key: key);

  final String? url;
  final Function(File? imageFile) onSetImage;

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {

  final _placeholderUrl = "https://news-feed.dunice-testing.com/api/v1/file/693d86bf-fedd-47e8-8f00-332780ab46b8.";
  File? _imageFile;
  bool _showsButtons = false;

  Widget _image() {
    if (_imageFile != null) {
      return Image.file(_imageFile!,
          fit: BoxFit.fitWidth);
    }
    if (widget.url != null) {
      return Image.network(widget.url!,
          fit: BoxFit.fitWidth);
    }
    else {
      return Image.network(_placeholderUrl,
          fit: BoxFit.fitWidth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          child: _image()),
        ElevatedButton(onPressed:
            () => setState(() => _showsButtons = !_showsButtons),
            child: Text('Select photo')),
        if (_showsButtons) Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: _getFromCamera, child: Text('Camera')),
            SizedBox(width: 20),
            OutlinedButton(onPressed: _getFromGallery, child: Text('Gallery'))
        ],)
      ],
    );
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        widget.onSetImage(_imageFile);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        widget.onSetImage(_imageFile);
      });
    }
  }
}