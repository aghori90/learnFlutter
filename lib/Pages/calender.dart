import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "calender",
    home: Calender(),
    theme: ThemeData(
      // brightness: Brightness.dark,
      primaryColor: Colors.indigo,
    ),
  ));
}

class Calender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalenderState();
  }
}

class _CalenderState extends State<Calender> {
  String tittle = 'Date Picker';
  DateTime _date = DateTime.now();
  // todo: datePicker Function
  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datepicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2050),
        // initialDatePickerMode: DatePickerMode.year,
        // todo: button color change and picked up color change
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              accentColor: Color(0xFFC41A3B),
            ),
            child:child,
          );
        });
    if (_datepicker != null && _datepicker != _date)
      setState(() {
        _date = _datepicker;
        print(
          _date.toString(),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('calender'),
          backgroundColor: Colors.amber[900],
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _selectDate(context);
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    'DatePicker',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(_date.toString())
              ],
            )
        ));
  }
}
