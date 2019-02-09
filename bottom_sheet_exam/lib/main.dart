import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  VoidCallback _callback;

  @override
  void initState() {
    super.initState();
    _callback = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _callback = null;
    });

    _key.currentState
        .showBottomSheet((context) {
          return Container(
            height: 300.0,
            color: Colors.orangeAccent,
            child: Center(
              child: Text("Hello World"),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _callback = _showBottomSheet;
            });
          }
        });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            color: Colors.pink,
            child: Center(
              child: Text("modal"),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _callback,
                child: Text("Persistent"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              RaisedButton(
                onPressed: _showModalSheet,
                child: Text("Modal"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
