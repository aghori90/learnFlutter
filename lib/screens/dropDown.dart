import 'package:flutter/material.dart';
// import './screens/statefull.dart';
// void main() => runApp(statefull());

void main(){
  runApp(
      MaterialApp(
        title: "Statefull App Widget",
        home: FavoriteCity(),
      )
  );
}

// todo: create a class that extends a "StatelessWidget", that returns a State in "createState()"

class FavoriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavouriteCityState();
  }
}

// todo: create a "State" class, with properties that may change
// todo: within "state" class, implement the "build()" method
// underscore before class to remain private to our own library.

class _FavouriteCityState extends State<FavoriteCity> {
  String nameCity = "";
  var _currencies = ['Rupees', 'Dollar', 'Pounds', 'others'];
  var _currentItemSelected = "Dollar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StateFull Example")),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              // onChanged: (String userInput) {
              onSubmitted: (String userInput) {
                setState(() {
                  nameCity = userInput;
                });
              },
            ),
            // todo: Adding a dropdown button
            DropdownButton<String> (
              items: _currencies.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected){
                // Your code to execute, when a menu item is selected from dropdown
                _dropdownItemSelected(newValueSelected); // func is call below
              },
              value: _currentItemSelected,
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Your Favourite City is $nameCity",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _dropdownItemSelected(newValueSelected)  {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}


// todo: call the statefull() to make the changes. Calling setState() tells framework to redraw widget