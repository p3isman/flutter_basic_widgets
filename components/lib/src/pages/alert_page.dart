import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show alert'),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10.0),
          ),
          onPressed: () {
            _showAlert(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // Called when button is pressed
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        // Can't exit the dialog if false
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('This is the content of the box'),
                SizedBox(height: 20.0),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              ),
            ],
          );
        });
  }
}
