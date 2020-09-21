import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Lost_Found.dart';

class Post_Found extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Post_FoundState();
  }

  // @override
  // _Lost_DetailState createState() => _Lost_DetailState();
}

class Post_FoundState extends State<Post_Found> {
  DateTime selectedDate = DateTime.now();
  DateTime pickedDate;
  TimeOfDay time;

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);

    if (t != null)
      setState(() {
        time = t;
      });
  }

  var flag = false;
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  Widget build(BuildContext context) {
    Widget pictureSection = Container(
      child: Image.asset(
        'assets/images/pic2.jpg',
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      ),
    );

    Widget inputSection1 = Container(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 25, bottom: 15),
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Name of the Object:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Container(
              child: TextField(
            decoration: InputDecoration(hintText: "Type here!"),
          )),
        ]));

    Widget dateTimePicker = Container(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "Date of Found: ${pickedDate.year},${pickedDate.month},${pickedDate.day}",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            ListTile(
              title: Text(
                "Time of Found: ${time.hour}:${time.minute}",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            )
          ],
        ));

    Widget inputSection2 = Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          alignment: Alignment.centerLeft,
          child: Text(
            "Where was it found:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
            child: TextField(
              decoration: InputDecoration(hintText: "Type here!"),
            )),
        Container(
          padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
          alignment: Alignment.centerLeft,
          child: Text(
            "More description:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 15, left: 32, right: 32),
            child: TextField(
              decoration: InputDecoration(hintText: "Type here!"),
            )),
      ],
    );

    Widget checkBox = Container(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 100),
        child: CheckboxListTile(
          value: this.flag,
          title: Text(
            "I've put it in the Rad House.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("这是二级标题"),
          // secondary: Icon(Icons.headset_mic),
          selected: this.flag,
          activeColor: Color.fromRGBO(20, 53, 84, 1),
          onChanged: (value) {
            setState(() {
              this.flag = value;
            });
          },
        ));

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text('Flutter layout demo'),
          // ),
          body: Stack(children: [
        ListView(
          children: [
            pictureSection,
            inputSection1,
            dateTimePicker,
            inputSection2,
            checkBox,
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
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => LFTabs()));
                }))),
        Positioned(
          left: 10,
          bottom: -10,
          child: Container(
              width: 400,
              padding: const EdgeInsets.only(
                  top: 35, left: 32, right: 32, bottom: 90),
              child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding:
                      EdgeInsets.only(top: 10, left: 32, right: 32, bottom: 10),
                  color: Color.fromRGBO(20, 53, 84, 1),
                  child: Text("Publish!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )))),
        )
      ])),
    );

    Future<TimeOfDay> _selectTime(BuildContext context) {
      final now = DateTime.now();

      return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
      );
    }

    Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
          context: context,
          initialDate: DateTime.now().add(Duration(seconds: 1)),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
  }
}

// TextField(
//         decoration: InputDecoration(
//           hintText: "Type here!"
//         ),
//       ),
//     );
