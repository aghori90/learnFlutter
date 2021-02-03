import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "File Upload",
    home: FileUpload(),
    theme: ThemeData(
      // brightness: Brightness.dark,
      primaryColor: Colors.indigo,
    ),
  ));
}

class FileUpload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileUpload();
  }
}

class _FileUpload extends State<FileUpload> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('File Upload'),
          backgroundColor: Colors.amber[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                  });
                },
                color: Colors.blue,
                child: Text(
                  'DatePicker',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ));
  }
}
