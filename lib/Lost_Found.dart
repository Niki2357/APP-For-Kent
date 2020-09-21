import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/test.dart';
import 'Home.dart';
import 'Lost.dart' as Lost;
import 'Found.dart' as Found;
import 'Mine.dart';
import 'Post_Found.dart';
import 'Post_Lost.dart';
import 'test.dart' as test;

void main() {
  runApp(new MaterialApp(home: new LFTabs()));
}

class LFTabs extends StatefulWidget {
  @override
  LFTabsState createState() => new LFTabsState();
}

class LFTabsState extends State<LFTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: <Widget>[
          Container(
              alignment: Alignment(0.0, 1.0),
              width: 450,
              height: 90,
              color: Color.fromRGBO(20, 53, 84, 1),
              child: Text("Lost and Found",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ))),
          TabBar(
              labelColor: Color.fromRGBO(20, 53, 84, 1),
              controller: controller,
              tabs: <Tab>[
                Tab(text: 'Lost'),
                Tab(text: 'Found'),
              ]),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Lost.LostTab(),
                  Positioned(
                      right: 25.0,
                      bottom: 100.0,
                      child: (FloatingActionButton(
                          heroTag: "2",
                          child: Icon(Icons.add_circle,
                              size: 65, color: Color.fromRGBO(20, 53, 84, 1)),
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Post_Lost()));
                          })))
                ],
              ),
              Stack(
                children: <Widget>[
                  Found.FoundTab(),
                  Positioned(
                      right: 25.0,
                      bottom: 100.0,
                      child: (FloatingActionButton(
                          heroTag: "2",
                          child: Icon(Icons.add_circle,
                              size: 65, color: Color.fromRGBO(20, 53, 84, 1)),
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Post_Found()));
                          })))
                ],
              )
            ],
          )),
        ],
      ),
    ]);
  }
}

// new Scaffold(
//   appBar: new AppBar(
//     title: new Text("Lost and Found"),
//     backgroundColor: Color.fromRGBO(20, 53, 84, 1),
//     bottom: new TabBar(
//       controller: controller,
//       tabs: <Tab>[
//         Tab(text: 'Lost'),
//         Tab(text: 'Found'),
//       ]
//     ),
//   ),
// body: new
// TabBarView(
//   controller: controller,
//   children: <Widget>[
//     new Lost.LostTab(),
//     new Found.FoundTab(),
//   ],
// )
// );
