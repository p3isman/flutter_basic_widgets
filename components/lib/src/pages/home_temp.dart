import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components Temp')),
      body: ListView(children: _createList(options)),
    );
  }

  List<Widget> _createList(List inputList) {
    return inputList.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.drag_handle),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
