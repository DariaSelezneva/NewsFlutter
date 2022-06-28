import 'package:flutter/material.dart';

class TagsList extends StatefulWidget {

  TagsList({Key? key,
    required this.tags,
    required this.activeTags,
    required this.onTapTag}) :
        super(key: key);

  final List<String> tags;
  final List<String> activeTags;
  final Function(String tag) onTapTag;

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {

  void onPressed(String tag) {
    setState(() {
      if (widget.activeTags.contains(tag)) {
        widget.activeTags.remove(tag);
      }
      else {
        widget.activeTags.add(tag);
      }
    });
    // send the tag up;
    widget.onTapTag(tag);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: widget.tags.length,
      itemBuilder: (context, index) {
        final tag = widget.tags[index];
        return widget.activeTags.contains(tag) ?
          ElevatedButton(
              onPressed: () => onPressed(tag),
              child: Text('#' + tag)) :
          OutlinedButton(
              onPressed: () => onPressed(tag),
              child: Text('#' + tag));
      },
    ));
  }
}