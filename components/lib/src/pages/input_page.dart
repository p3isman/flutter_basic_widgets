import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';

  // The initial value MUST be one of the options from the DropdownMenuItem in case we use it as value
  String _selectedOption = 'Superpoder';

  List<String> _powers = [
    'Volar',
    'Rayos X',
    'Invisibilidad',
    'Velocidad',
    'Fuerza'
  ];

  TextEditingController _inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        children: [
          _createName(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createPassword(re: true),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createName() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Nombre',
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.add_circle),
      ),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Email',
        prefixIcon: Icon(Icons.mail),
        suffixIcon: Icon(Icons.add_circle),
      ),
    );
  }

  Widget _createPassword({re = false}) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: re ? 'Re-enter password' : 'Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.add_circle),
      ),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputController,
      // Avoid selecting text
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Fecha de nacimiento',
        prefixIcon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.add_circle),
      ),
      onTap: () {
        // Remove focus of field
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime(2022),
    );

    if (picked != null) {
      setState(() {
        // Get date from datetime
        _date = picked.toString().split(' ')[0];
        // Change text inside the field
        _inputController.text = _date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 20.0),
        DropdownButton(
          hint: Text(_selectedOption),
          items: _getOptionsDropdown(),
          onChanged: (opt) {
            setState(() {
              _selectedOption = opt;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];
    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return list;
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }
}
