import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
    title: "导航1",
    home: FirstScreen(),
));

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("导航页面"),
            
        ),
        body: Center(
            child: RaisedButton(
                child: Text("查看详情"),
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context)=> new SecondScreen()
                    ));
                   
                },
            ),
        ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('第二页面'),
      ),
      body: Center(
          child: RaisedButton(
              child: Text('返回'),
              onPressed: (){
                  Navigator.pop(context);
              },
          ),
          
      ),
    );
  }
}

