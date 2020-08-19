import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Lost_Found.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Lost_Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Lost_DetailState();
  }

  // @override
  // _Lost_DetailState createState() => _Lost_DetailState();
}

class _Lost_DetailState extends State<Lost_Detail> {
  @override
  Widget build(BuildContext context) {
    Widget pictureSection = Stack(
      children: <Widget>[
        Container(
          child: Image.asset(
            'assets/images/pic2.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                ),
                Text(
                  'Losted on 9:00 AM',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20
                  ),
                ),
                Text(
                  '@ Dining Hall',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20
                  ),
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
      padding:(
        EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30)
      ) ,
      
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
  }}