import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP._5PUXXKc95rpHsCB7KufZQHaIZ%26pid%3DApi&f=1')),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://images.jpost.com/image/upload/f_auto,fl_lossy/t_Article2016_ControlFaceDetect/390855'),
          placeholder: Image.asset(
            'assets/spinner.gif',
            height: 20,
            width: 20,
          ).image,
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
