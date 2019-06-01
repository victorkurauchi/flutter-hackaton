import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('This is your profile'),
      ),
      body: ListView(
        children: [
          Image.network(            
            'https://images.unsplash.com/photo-1558980395-be8a5fcb4251?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2251&q=80',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          Text('Go back!'),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ] 
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Nootan Ghimire',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'You can say Im not like any other developer!'
        'Not because Im really good (although thats true) but'
        'because Im not a coffee lover (deal breaker?).'
        'Ive been in the full stack space for a few years now.'
        'Im proficient in Flutter, Dart, Angular, React, Firebase, Node, .NET and the usual databases.'
        'My focus for future roles is Flutter or Flutter with a mixture of other tech',
    softWrap: true,
  ),
);


class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/explore.png');
    var image = new Image(image: assetsImage, width: 48.0, height: 48.0);
    return new Container(child: image);
  }
}