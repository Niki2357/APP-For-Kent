import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:my_app/widgets.dart';
import 'Found_Detail.dart';
import 'utils.dart';

double _sigmaX = 5; // from 0-10
double _sigmaY = 3; // from 0-10
double _opacity = 0.1;

class FoundTab extends StatefulWidget {
  @override
  _FoundTabState createState() => _FoundTabState();
}

class _FoundTabState extends State<FoundTab> {
  static const _itemsLength = 20;

  List<Color> colors;
  List<String> titles;
  List<String> contents;

  get random => null;

  @override
  void initState() {
    colors = getRandomColors(_itemsLength);
    titles = List.generate(_itemsLength, (index) => generateRandomHeadline());
    contents =
        List.generate(_itemsLength, (index) => lorem(paragraphs: 1, words: 5));
    contents =
        List.generate(_itemsLength, (index) => lorem(paragraphs: 1, words: 5));
    super.initState();
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _itemsLength) return null;

    return SafeArea(
      top: false,
      bottom: false,
      child: Card(
        elevation: 1.5,
        margin: EdgeInsets.fromLTRB(15, 12, 15, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Found_Detail()));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 600,
                    height: 240,
                    child: Container(
                      child: BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                        child: Container(
                          color: Colors.black.withOpacity(_opacity),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/pic2.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Padding(padding: EdgeInsets.only(left: 16)),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Name: " + titles[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        "Found on " + contents[index],
                      ),
                      Text(
                        "Found at " + contents[index],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Found"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: ListView.builder(
        itemBuilder: _listBuilder,
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
