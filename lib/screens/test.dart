import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Learn Flutter",
          home: Scaffold(
              appBar: AppBar(
                title: Text("Learn Flutter App Devlopment"),
                backgroundColor: Colors.amber,
              ),
              body: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Welcome:",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 40.0,
                        fontFamily: "Kaushan Script",
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )),
                  Expanded(
                      child: Text(
                    "To the world of Flutter",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 40.0,
                        fontFamily: "Kaushan Script",
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ))
                ],
              ))),
    ));
  }
}
