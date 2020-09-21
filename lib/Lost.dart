import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:my_app/widgets.dart';
import 'Lost_Detail.dart';
import 'utils.dart';

class LostTab extends StatefulWidget {
  @override
  _LostTabState createState() => _LostTabState();
}

class _LostTabState extends State<LostTab> {
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
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Lost_Detail()));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/pic2.jpg',
                      width: 300, height: 150, fit: BoxFit.fill),
                ),
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
                        "Losted on " + contents[index],
                      ),
                      Text(
                        "Losted at " + contents[index],
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
