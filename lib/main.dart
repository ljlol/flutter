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
                body: new ListView(
                    children: <Widget>[
                    
                        new Image.network(
                            'https://www.baidu.com/img/bd_logo1.png?where=super'
                        ),
                        new Image.network(
                            'https://www.baidu.com/img/bd_logo1.png?where=super'
                        ),
                        new Image.network(
                            'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=57280421,1165147730&fm=85&app=63&f=JPEG?w=121&h=75&s=F4FEAD7757A34715CC5E596D0300306A'
                        ),
                    ],
                ),
            ),
        );
    }
}