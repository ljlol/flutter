import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: '欢迎玩flutter',
            home: Scaffold(
                appBar: AppBar(
                    title: Text('欢迎来玩flutter'),
                ),
                body: Center(
                    child: Text('hello world'),
                ),
            ),
        );
    }
}