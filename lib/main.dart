import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: '欢迎玩flutter',
            home: Scaffold(
                appBar: new AppBar(
                    title: new Text('listview widget'),
                ),
                body: Center(
                    child: Container(
                        height: 200.0,
                        child: MyList(),
                    ),
                )
            ),
        );
    }
}

class MyList extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    // TODO: implement build
        return ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
                new Container(
                    width: 180.0,
                    color: Colors.lightBlue,
                ),
                new Container(
                    width: 180.0,
                    color: Colors.amber,
                ),
                new Container(
                    width: 180.0,
                    color: Colors.deepOrange,
                ),
                new Container(
                    width: 180.0,
                    color: Colors.deepPurpleAccent,
                ),
            ]
        );
    }
}