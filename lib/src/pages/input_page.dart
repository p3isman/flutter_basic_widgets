import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        children: [_createInput('Nombre'), _createInput('Apellidos')],
      ),
    );
  }

  Widget _createInput(String hint) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        counter: Text('Caracteres restantes:', style: TextStyle(fontSize: 12)),
        hintText: hint,
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.add_circle),
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
