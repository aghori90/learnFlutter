import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TextFieldExample(),
        ),
      ),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 200),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Flexible(
            child: TextFormField(
              validator: (value) => value.isEmpty ? 'Enter an email' : null,
              onChanged: (value) {
                setState(() => email = value);
              },
              decoration:
              InputDecoration(icon: Icon(Icons.person),
                hintText: "Email",
                errorStyle: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),

          ),
          Expanded(
            flex: 0,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            //sign in;
                          }
                        },
                        child: Text("Login")))),
          )
        ]),
      ),
    );
  }
}