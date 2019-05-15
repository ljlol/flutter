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
                body: GridView.count(
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 3,
                    children: <Widget>[
                        const Text('星期一'),
                        const Text('星期er'),
                        const Text('星期三'),
                        const Text('星期四'),
                        const Text('星期五'),
                        const Text('星期六'),
                    ],
                )
            ),
        );
    }
}