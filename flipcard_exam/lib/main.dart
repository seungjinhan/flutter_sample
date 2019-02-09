import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "http://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2RB/image/p4r9UUNR9IFdXvLWEqr-n1m3R0g.png"),
              ),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 400.0,
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: Material(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadiusDirectional.circular(24.0),
                        //shadowColor: Colors.red,//(0x802196F3).withOpacity(0.9),
                        child: _profileContainer(),
                      ),
                      back: Material(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadiusDirectional.circular(24.0),
                        //shadowColor: Color(0x802196F3).withOpacity(0.2),
                        child: _elseContainer(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _elseContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 130.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: ListTile(
                    leading: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-9/51378834_2043923325676604_9208862232874582016_o.jpg?_nc_cat=107&_nc_ht=scontent-icn1-1.xx&oh=58511f1e36de642fd303746b9f61aee0&oe=5CFB5B8E"),
                          )),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Text(
                        "my drawing",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("Trip Bus",
                          style: TextStyle(
                              color: Colors.pinkAccent, fontSize: 20.0)),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.tealAccent, //Color(0xffff520d).withOpacity(0.9),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Container(
            child: _elseDetail(),
          ),
        ],
      ),
    );
  }

  Widget _profileContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 130.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: ListTile(
                    leading: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-1/p320x320/44830405_1891453944256877_8744494955856134144_n.jpg?_nc_cat=104&_nc_ht=scontent-icn1-1.xx&oh=80be924d7579f84a35eb30523c4ef69e&oe=5CB63CA0"),
                          )),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Text(
                        "deepplin",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("Backend Devleoper",
                          style: TextStyle(
                              color: Color(0xffffffff), fontSize: 20.0)),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xffff520d).withOpacity(0.9),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Container(
            child: _detailProfie(),
          ),
        ],
      ),
    );
  }

  Widget _detailProfie() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 8.0, right: 8.0),
          child: Text(
            'good man',
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 20.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 20.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.map,
                  color: Color(0xffff520d),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: Text(
                    "Singapore",
                    style: TextStyle(color: Color(0xffff520d), fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                  //etail(),
                  )
            ],
          ),
        )
      ],
    );
  }

  Widget _elseDetail() {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.email,
                    color: Color(0xffff0d41),
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "xxxxx@gmail.com",
                    style: TextStyle(color: Color(0xffff0d41), fontSize: 24.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
