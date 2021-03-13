import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      // Length of the shadow
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Card 1'),
            subtitle: Text('Example text'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Cancel')),
              TextButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 5.0))
            ]),
        // ClipRRect rounds rect corners (inserts a render object above its child)
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ));
  }

  // Image
  final card = new Container(
    child: Column(
      children: [
        // Show temporary image while it is loading
        FadeInImage(
          placeholder: AssetImage('assets/spinner.gif'),
          image: NetworkImage(
              'https://iso.500px.com/wp-content/uploads/2015/11/photo-129299193-1500x775.jpg'),
          height: 200,
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text('This is some example text')),
      ],
    ),
  );
}
