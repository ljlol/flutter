import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: '欢迎玩flutter',
            home: Scaffold(
                
                body: Center(
                    child: Container(
                        child: new Text(
                            'hello container',
                            style: TextStyle(fontSize: 40.0),
                        ),
                        alignment: Alignment.topLeft,
                        // color: Colors.lightBlue,
                        width: 500.0,
                        height: 400.0,
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(5.0),
                        decoration: new BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue,Colors.greenAccent,Colors.purple]
                            ),
                            border: Border.all(width: 2.0,color: Colors.red)
                        ),
                    )
                ),
            ),
        );
    }
}