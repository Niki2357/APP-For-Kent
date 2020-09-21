import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:my_app/widgets.dart';
import 'Explore_Detail.dart';
import 'Lost_Detail.dart';
import 'utils.dart';

class ExploreTabs extends StatefulWidget {
  @override
  _ExploreTabsState createState() => _ExploreTabsState();
}

class _ExploreTabsState extends State<ExploreTabs> {
  static const _itemsLength = 20;

  List<Color> colors;
  List<String> titles;
  List<String> contents;
  var numberSignedUp = 18;
  var numberAll = 20;
  var solidLength;

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
    solidLength = (numberSignedUp / numberAll) * 270;

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
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => exploreDetail()));
                },
                child: Padding(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        // decoration: new BoxDecoration(
                        //     border: Border(
                        //         bottom:
                        //             BorderSide(color: Colors.black, width: 1))),
                        child: Row(
                          children: <Widget>[
                            Text("Robotics"),
                            Spacer(),
                            Text("Robotics Club")
                          ],
                        ),
                      ),
                      Container(
                        // decoration: new BoxDecoration(
                        //     border: Border(
                        //         bottom:
                        //             BorderSide(color: Colors.black, width: 1))),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 0, left: 15, right: 15),
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/images/pic2.jpg',
                                width: 140, height: 140, fit: BoxFit.fill),
                            Container(
                                height: 150,
                                // decoration: new BoxDecoration(
                                //     border: Border(
                                //         bottom: BorderSide(
                                //             color: Colors.black, width: 1))),
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Club Meeting!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text("13:00-17:00, Jun. 1st"),
                                    Text("Sign up before May 30th"),
                                    Text(
                                      lorem(
                                        paragraphs: 1,
                                        words: 1,
                                      ),
                                      // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                      // overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 15, left: 15, right: 15),
                  child: Row(children: [
                    Stack(children: [
                      Container(
                          height: 15,
                          width: 270,
                          decoration: new BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(20, 53, 84, 1),
                                  width: 1),
                              borderRadius: BorderRadius.circular(20))),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        child: Container(
                          color: Color.fromRGBO(20, 53, 84, 1),
                          width: solidLength,
                          height: 15,
                          padding: EdgeInsets.all(1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            child: Container(
                              color: Color.fromRGBO(20, 53, 84, 1),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 15,
                      //   width: solidLength,
                      //   decoration: new BoxDecoration(
                      //       border: Border.all(color: Colors.orange, width: 1),
                      //       borderRadius: BorderRadius.circular(20)),
                      //   // color: Colors.blue,
                      // ),
                    ]),
                    Spacer(),
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 0),
                        child: Text("🔥", style: TextStyle(fontSize: 20))),
                    Container(
                        padding:
                            const EdgeInsets.only(top: 2, left: 3, right: 10),
                        child: Text("$numberSignedUp/$numberAll"))
                  ]))
            ])));
  }

  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return ListView.builder(
      itemBuilder: _listBuilder,
    );
  }

  Widget _buildIos(BuildContext context) {
    // return CupertinoPageScaffold(
    //   navigationBar: CupertinoNavigationBar(),
    //   child: ListView.builder(
    //     itemBuilder: _listBuilder,
    //   ),f
    // );
    return ListView.builder(
      itemBuilder: _listBuilder,
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
