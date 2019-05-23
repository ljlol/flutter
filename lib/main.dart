import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(List<String> args) {
    runApp(MaterialApp(
        title:'页面',
        home: FirstPage(),
    ));
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('要电话'),
            
        ),
        body: Center(
            child: RouteButton(),
        ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: (){_navigeteToXiaoJieJie(context);},
        child: Text('找小姐姐'),
    );
  }

  _navigeteToXiaoJieJie(BuildContext context) async{
        final result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>XiaoJieJie())
        );

        Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result'),));
  }
}

class XiaoJieJie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('小姐姐'),
      ),
      body: Center(
          child: Column(
              children: <Widget>[
                  RaisedButton(
                      child: Text('大长腿'),
                      onPressed: (){
                          Navigator.pop(context,'大长腿:111223344');
                      },
                  ),
                  RaisedButton(
                      child: Text('大屁股'),
                      onPressed: (){
                          Navigator.pop(context,'大屁股:111223344');
                      },
                  )
              ],
          ),
      ),
    );
  }
}


