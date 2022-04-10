import 'package:flutter/material.dart';
import 'package:module_3_movies_app/widgets/title_text.dart';

class SmartListView extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final EdgeInsets padding;
  final Function onListEndReached;

  SmartListView({
    required this.itemCount,
    required this.itemBuilder,
    required this.padding,
    required this.onListEndReached,
  });

  @override
  State<SmartListView> createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {
  var _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        // start
        if (_scrollController.position.pixels == 0) {
          print("start the list reached");
        } else {
          print("end the list reached");
          widget.onListEndReached();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: widget.itemCount != 0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            padding: widget.padding,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder),
      ),
    );
  }
}
