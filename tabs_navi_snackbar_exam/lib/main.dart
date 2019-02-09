import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int current_step = 0;

  List<Step> my_steps = [
    Step(
        title: Text("Step 1"), content: Text("Some content 1"), isActive: true),
    Step(
        title: Text("Step 2"), content: Text("Some content 2"), isActive: true),
    Step(
        title: Text("Step 3"), content: Text("Some content 3"), isActive: true),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utils App"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.email)),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[NewPage("First"), NewPage("Second")],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => print("good"),
      ),
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.email)),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String _title;

  const NewPage(this._title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_title),
      ),
    );
  }
}

class Body extends StatelessWidget {
  AlertDialog dialog = AlertDialog(
    content: Text(
      "Dialog is up...",
      style: TextStyle(fontSize: 30.0),
    ),
    title: Text("Hello"),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text(
            "Click",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.redAccent,
          // onPressed: () => Scaffold.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text("I am pressed"),
          //         duration: Duration(seconds: 3),
          //       ),
          //     ),
          onPressed: () =>
              showDialog(context: context, builder: (context) => dialog),
        ),
      ),
    );
  }
}
