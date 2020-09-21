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
    Widget pictureSection = Container(
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
      padding: (EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30)),
      child: Text(
        lorem(paragraphs: 1, words: 50),
        softWrap: true,
        style: TextStyle(fontSize: 15),
      ),
    );

    return Stack(children: [
      ListView(
        children: [
          pictureSection,
          titleSection,
          textSection,
        ],
      ),
      Positioned(
          left: 20.0,
          top: 50.0,
          child: (FloatingActionButton(
              heroTag: FloatingActionButtonLocation.centerDocked,
              child: Icon(Icons.arrow_back),
              backgroundColor: Color.fromRGBO(20, 53, 84, 1),
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => LFTabs()));
              }))),
      Positioned(
        left: 10,
        bottom: -10,
        child: Container(
            width: 400,
            padding:
                const EdgeInsets.only(top: 35, left: 32, right: 32, bottom: 90),
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding:
                    EdgeInsets.only(top: 10, left: 32, right: 32, bottom: 10),
                color: Color.fromRGBO(20, 53, 84, 1),
                child: Text("I found it!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )))),
      )
    ]);
  }
}
