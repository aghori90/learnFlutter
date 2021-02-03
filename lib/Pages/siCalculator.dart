import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: SIForm(),
    theme: ThemeData(
      // brightness: Brightness.dark,
      primaryColor: Colors.indigo,
    ),
  ));
}

// todo: creating a stateful class for SIForm
class SIForm  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm>{
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final _minimumPadding = 5.0; // for defining padding
  var _currentItemSelected = ''; // for dropdown
  var displayResult = ''; // for displaying answer

  // for fetching textfields input
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController       = TextEditingController();
  TextEditingController termController      = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('SI Calculator'),
        // backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            buildImage(),
            Padding(
              // todo: textfield1
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: principalController,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g. 12000',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            // todo: textfiels2
            Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: roiController,
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'Enter Interest in percent ',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            // todo: adding row for the term & dropdown elements
            Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0,),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          controller: termController,
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        )),
                    // todo: creating a dropdown
                    Container(width:25.0 ), // for difference btn term & dd
                    Expanded(
                        child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currentItemSelected,
                          onChanged: (String newValueSelected) {
                            // todo: code to be executed here when menu is selected
                            _onDropDownItemSelected(newValueSelected); // go down for function
                          },
                        ))
                  ],
                )),
            // todo: raised button row
            Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0,),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        elevation: 8.0,
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            this.displayResult = _calculateTotalReturns();
                          });
                        }
                    ) ,
                  ),
                  Container(width:25.0 ), // for difference btn 2 buttons
                  Expanded(
                    child: RaisedButton(
                        elevation: 8.0,
                        child: Text('Reset',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            _reset();
                          });
                        }
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),
              child: Text(this.displayResult,style: textStyle,),
            )
          ],
        ),
      ),
    );
  }

  // todo: ImageAssets
  Widget buildImage() {
    AssetImage assetImage = AssetImage('images/rupees.png');
    Image image = Image(
      image: assetImage,
      width: 120.0,
      height: 120.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
    );
  }

// todo: function for dropdown
  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this. _currentItemSelected = newValueSelected;
    });
  }

  // todo: calculate returns
  String _calculateTotalReturns() {
    // extracting the value from the fields
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  // todo: reset button
  void _reset(){
    principalController.text  ='';
    roiController.text        ='';
    termController.text       ='';
    displayResult             ='';
    _currentItemSelected      = _currencies[0];
  }
}


