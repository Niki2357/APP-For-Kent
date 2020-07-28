import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Lost.dart' as Lost;
import 'Found.dart' as Found;

void main() {
  runApp(new MaterialApp(
    home: new LFTabs()
    ));
}

class LFTabs extends StatefulWidget{
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lost and Found"),
        backgroundColor: Color.fromRGBO(20, 53, 84, 1),
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(text: 'Lost'),
            Tab(text: 'Found'),
          ]
        ),
      ),
    body: new TabBarView(
      controller: controller,
      children: <Widget>[
        new Lost.LostTab(),
        new Found.FoundTab(),
      ],
    ) 
    );
  }
}

