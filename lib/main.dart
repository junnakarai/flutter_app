import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  static DateTime _now = DateTime.now();
  static DateTime _thisWeekMonday = _now.subtract(new Duration(days: _now.weekday - 1));
  var _weekName =  ['月', '火', '水', '木', '金', '土', '日'];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DateTime'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Next Week'),
              onPressed: (){
                _pushButton();
              },
            ),
            ListView.builder(
              padding: const EdgeInsets.all(6.0),
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int i) {
                if (i.isOdd) return Divider();
                final index = i ~/ 2;
                final indexDay = _thisWeekMonday.add(new Duration(days: index));
                if (index < 7) {
                  return ListTile(
                    title: Text(" ${indexDay.month}/${indexDay.day} (${_weekName[index]})",textAlign: TextAlign.center,),
                    onTap: (){},
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _pushButton() {
    setState(() {
      _thisWeekMonday = _thisWeekMonday.add(new Duration(days: 7));
    });
  }

}