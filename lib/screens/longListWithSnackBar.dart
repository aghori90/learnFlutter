import 'package:flutter/material.dart';
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
