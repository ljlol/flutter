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
                        child: new Image.network(
                            'https://www.baidu.com/img/bd_logo1.png?where=super',
                            scale: 1.0,
                            color: Colors.greenAccent,
                            colorBlendMode: BlendMode.darken,
                        ),
                        width: 300.0,
                        height: 200.0,
                        color: Colors.lightBlue,
                    )
                ),
            ),
        );
    }
}