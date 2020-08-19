import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Lost_Found.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

double _sigmaX = 5; // from 0-10
double _sigmaY = 3; // from 0-10
double _opacity = 0.1;

class Found_Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Found_DetailState();
  }

  // @override
  // _Lost_DetailState createState() => _Lost_DetailState();
}

class _Found_DetailState extends State<Found_Detail> {
  @override
  Widget build(BuildContext context) {
    Widget pictureSection = Stack(
      children: <Widget>[
        Container(
          width: 600,
          height: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/pic2.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
            child: Container(
              color: Colors.black.withOpacity(_opacity),
            ),
          ),
        ),
        // Container(
        //   child: Image.asset(
        //     ,

        //     fit: BoxFit.cover,
        //   ),
        // ),
        Positioned(
            left: 20.0,
            top: 20.0,
            child: (FloatingActionButton(
                heroTag: FloatingActionButtonLocation.centerDocked,
                child: Icon(Icons.arrow_back),
                backgroundColor: Color.fromRGBO(20, 53, 84, 1),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LFTabs()));
                })))
      ],
    );
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'School Bag',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Text(
                  'Found on 9:00 AM',
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                ),
                Text(
                  '@ Dining Hall',
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection = Container(
      // decoration: BoxDecoration(
      //   border: Border(top: BorderSide (color: Colors.grey, width: 1.0)
      //   )

      // ),
      padding: (EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30)),

      child: Text(
        lorem(paragraphs: 1, words: 50),
        softWrap: true,
        style: TextStyle(fontSize: 15),
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Flutter layout demo'),
        // ),
        body: ListView(
          children: [
            pictureSection,
            titleSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
