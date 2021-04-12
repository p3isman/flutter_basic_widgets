import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components')),
      body: _pagesList(),
    );
  }

  /// Load data for the list from [menuProvider] with FutureBuilder
  Widget _pagesList() {
    return FutureBuilder(
      future: menuProvider.loadData(),

      // Value of the future while it is being loaded
      initialData: [],

      // The AsyncSnapshot contains the state of the future and its data. It is passed when building the widget
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _itemList(snapshot.data, context),
        );
      },
    );
  }

  // Build list from data
  List<Widget> _itemList(List<dynamic> data, BuildContext context) {
    return data.map((element) {
      return Column(
        children: [
          ListTile(
            title: Text(element['texto']),
            leading: getIcon(element['icon']),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // To navigate to another page we need the BuildContext and a MaterialPageRoute for destination
              Navigator.pushNamed(context, element['ruta']);
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
