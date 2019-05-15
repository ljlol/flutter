import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp(
    
));

class MyApp extends StatelessWidget{

    

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: '欢迎玩flutter',
            home: Scaffold(
                appBar: new AppBar(
                    title: new Text('grid widget'),
                ),
                body: new Row(children: <Widget>[
                    Expanded(child: new RaisedButton(
                        onPressed: (){

                        },
                        color: Colors.redAccent,
                        child: new Text('红色按钮'),
                    ),),
                    
                    new RaisedButton(
                        onPressed: (){

                        },
                        color: Colors.orangeAccent,
                        child: new Text('黄色按钮'),
                    ),
                    new RaisedButton(
                        onPressed: (){

                        },
                        color: Colors.pinkAccent,
                        child: new Text('粉色按钮'),
                    ),
                ],)
            ),
        );
    }
}