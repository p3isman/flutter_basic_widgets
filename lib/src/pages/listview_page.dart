import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = [];
  int _lastItem = 0;

  // Called when inserted into widget tree
  @override
  void initState() {
    super.initState();
    _add10();

    // Closure called when object changes
    _scrollController.addListener(() {
      // When the scroll's final position is reached (can define a distance in pixels)
      if (_scrollController.position.pixels -
              _scrollController.position.maxScrollExtent <=
          10.0) _add10();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    // Builds a ListView by cycling through a list
    return ListView.builder(
      controller: _scrollController,
      // Length of the ListView
      itemCount: _numberList.length,
      // Called as many times as itemCount
      itemBuilder: (context, index) {
        final imageIndex = _numberList[index];
        return FadeInImage(
            placeholder: Image.asset('assets/spinner.gif').image,
            image:
                NetworkImage('https://picsum.photos/400/?image=$imageIndex'));
      },
    );
  }

  // Adds 10 items to the list
  void _add10() {
    for (int i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }
}
