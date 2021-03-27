import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 5.0;
  int _size = 5;
  bool _checkbox = false;
  bool _viewImage = false;
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(children: [
          _createSlider(),
          _createSwitch(),
          _createCheckbox(),
          Expanded(
              child: Visibility(
            visible: _viewImage,
            child: _createImage(),
          )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Tamaño: $_size',
                textAlign: TextAlign.center,
              )),
        ]),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      min: 0.0,
      max: 10.0,
      divisions: 10,
      label: 'Tamaño de la imagen',
      value: _sliderValue,
      onChanged: !_switch
          ? (value) {
              setState(() {
                _sliderValue = value;
                _size = value.toInt();
              });
            }
          : null,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://logos-download.com/wp-content/uploads/2018/03/Superman_logo_pink.png'),
      width: 30 * _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Visible:'),
      value: _checkbox,
      onChanged: (value) {
        setState(() {
          _checkbox = value;
          _viewImage = !_viewImage;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider:'),
      value: _switch,
      onChanged: (value) {
        setState(() {
          _switch = value;
        });
      },
    );
  }
}
