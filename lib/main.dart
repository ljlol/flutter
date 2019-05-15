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
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Center(child:Text('zhouyi')),
                        Expanded(child: Center(child:Text('zhouer'))),
                        Text('zhpusan')
                    ],
                )
            ),
        );
    }
}