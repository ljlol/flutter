import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp(
    
));

class MyApp extends StatelessWidget{

    

    @override
    Widget build(BuildContext context) {
        var stack = new Stack(
            alignment: const FractionalOffset(0.5, 0.5),
            children: <Widget>[
                new CircleAvatar(
                    backgroundImage: new NetworkImage('https://www.baidu.com/img/bd_logo1.png?where=super'),
                    radius: 100.0,
                ),
                new Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Text('www.test.com'),
                ),
                new Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Text('六六六'),
                )
            ],
        );

        var card = new Card(
            child: Column(
                children: <Widget>[
                    ListTile(
                        title: Text('杭州市滨江区',style:TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text('666：13322332233'),
                        leading: Icon(Icons.access_time,color:Colors.lightBlue),
                    ),
                    new Divider(),
                    ListTile(
                        title:new Text('北京市海淀区中国科技大学',style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: new Text('2222:1513938888'),
                        leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
                    ),
                    new Divider(),
                    ListTile(
                        title: Text('浙江省绍兴市越城区',style: TextStyle(fontWeight: FontWeight.w400),),
                        subtitle: Text('777:122233333'),
                        leading: Icon(Icons.account_balance,color:Colors.deepOrange),
                    ),
                    new Divider()
                ],
            ),
        );
        return MaterialApp(
            title: '欢迎玩flutter',
            home: Scaffold(
                appBar: new AppBar(
                    title: new Text('stack'),
                ),
                body: Center(
                    child: card,
                )
            ),
        );
    }
}