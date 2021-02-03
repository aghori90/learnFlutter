import 'package:flutter/material.dart';

class image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Image Asset",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learn Learn Futter Devlopment App'),
          backgroundColor: Colors.amber[900],
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            color: Colors.tealAccent,
          ),
        ),
      ),
    );
  }
}