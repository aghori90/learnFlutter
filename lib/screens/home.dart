import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "test",
        home: Scaffold(
        appBar: AppBar(title: Text('Learn Futter Devlopment App'),
        backgroundColor: Colors.amber[900],
        ),
        body: Center(
          child: Container(
            // padding: EdgeInsets.only(left: 50.0),
            alignment: Alignment.center,
            color: Colors.tealAccent,
            child: Column(
              children: <Widget> [
                Row( // Row 1
                  children: <Widget> [
                    Expanded(child: Text(
                      "Aarambh :",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "Kaushan Script",
                          fontWeight: FontWeight.w700),
                    )),
                    Expanded(child: Text(
                      "The Bigning of Flutter",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "Kaushan Script",
                          fontWeight: FontWeight.w700),
                    )),
                  ],
                ),
                Row( // Row 2
                  children: <Widget> [
                    Expanded(child: Text(
                      "Learn :",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "Kaushan Script",
                          fontWeight: FontWeight.w700),
                    )),
                    Expanded(child: Text(
                      "How to Code in Flutter",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "Kaushan Script",
                          fontWeight: FontWeight.w700),
                    )),
                  ],
                ),
                TestImageAssets(),
                TestButton()
              ],
            )
          ),
        ),
      ),
    );
  }
}

// todo: Image
class TestImageAssets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/test.png');
    Image image = Image(image: assetImage, width: 100.0, height: 100.0,);
    return Container(child: image,);
  }
}

// todo: Button
class TestButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.blue,
        child: Text("Click",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
              fontFamily: "Kaushan Script",
              fontWeight: FontWeight.w700
          ),
        ),
        elevation: 8.0,
        onPressed: (){
          // define action
          testButton(context); // context from build function
        },
      ),
    );
  }
  // todo: method for button
  void testButton(BuildContext context){
    var alertDialog = AlertDialog(
      title:Text("learn flutter devlopment"),
      content: Text("learn Flutter"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }
}


// ====================================================

// import 'package:flutter/material.dart';
// import './screens/home.dart';
// import './screens/test.dart';
// import './screens/image.dart';

// void main() => runApp(image());
// void main() => runApp(home());
// void main() => runApp(test());

void main(){
  runApp(MaterialApp(
    title: "Exploring UI Widgets",
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text("Basic List View"),),
      body: getListView(),
      floatingActionButton: FloatingActionButton( // floating button action
        onPressed: (){
          debugPrint("FAB Clicked");
        },
        child: Icon(Icons.add),
        tooltip: 'Add ONe More Item',
      ),
    ),
  ));
}

// todo: Show the Snake Bar
void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(content: Text("You just tapped the $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint("Performing dummy UNDO operation");
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

// todo: creating a list of 1000 records
List<String> getListElements(){
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}
Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItems[index]),
        onTap:(){
          // debugPrint('${listItems[index]} was tapped');
          showSnackBar(context, listItems[index]);
        }
    );
  });
  return listView;
}

