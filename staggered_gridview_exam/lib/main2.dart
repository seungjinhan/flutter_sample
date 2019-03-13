import 'package:flutter/material.dart';
import 'package:staggered_gridview_exam/count_state.dart';
import 'package:staggered_gridview_exam/counter_bloc2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staggered_gridview_exam/counter_event.dart';

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc2();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: CounterWidget(widget: widget),
    );
// This tr
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<CounterBloc2>(context),
          builder: (context, CountState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc2>(context).onIncrement(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc2>(context).onDecrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
