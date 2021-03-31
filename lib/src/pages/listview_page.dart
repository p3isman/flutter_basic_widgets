import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = [];
  int _itemIndex = 0;
  bool _isLoading = false;

  // Called when widget is inserted into widget tree
  @override
  void initState() {
    super.initState();
    _add10();

    // Closure called when object changes
    _scrollController.addListener(() {
      // When the scroll's final position is reached (can define a distance in pixels)
      if (_scrollController.position.maxScrollExtent -
              _scrollController.position.pixels <=
          10.0) _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Stack(
        children: [_createList(), _createLoading()],
      ),
    );
  }

  // Called when exiting the tree
  @override
  void dispose() {
    super.dispose();
    // Delete scroll controller when exiting screen to avoid memory leaks
    _scrollController.dispose();
  }

  Widget _createList() {
    // Refresh content on pull
    return RefreshIndicator(
      onRefresh: _getPage1,
      // Builds a ListView by cycling through a list
      child: ListView.builder(
        controller: _scrollController,
        // Length of the ListView
        itemCount: _numberList.length,
        // Called as many times as itemCount
        itemBuilder: (context, index) {
          final currentImage = _numberList[index];
          return FadeInImage(
              placeholder: Image.asset('assets/spinner.gif').image,
              image: NetworkImage(
                  'https://picsum.photos/400/?image=$currentImage'));
        },
      ),
    );
  }

  // Called on refresh
  Future<void> _getPage1() async {
    setState(() {});
    final duration = new Duration(seconds: 1);
    new Timer(duration, () {
      _numberList.clear();
      _itemIndex++;
      _add10();
    });
    return Future.delayed(duration);
  }

  // Adds 10 items to the list
  void _add10() {
    for (int i = 1; i < 10; i++) {
      _itemIndex++;
      _numberList.add(_itemIndex);
    }
    setState(() {});
  }

  // Fake http request
  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    _add10();
  }

  Widget _createLoading() {
    // Show spinner if content is being loaded
    return _isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(child: CircularProgressIndicator()),
              SizedBox(
                height: 20.0,
              )
            ],
          )
        : Container();
  }
}
