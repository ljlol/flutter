import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() => runApp(
  ListPage()
);

class ListPage  extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var _scrollOffsetContenner = ScrollController(initialScrollOffset: 100.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Listener(
        onPointerDown: (downPointEvent){
          print(downPointEvent.size);
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          controller: _scrollOffsetContenner,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 200.0,
              color: Colors.blue,
            ),
            Container(
              height: 100.0,
              width: 200.0,
              color: Colors.red,
            ),
            Container(
              height: 100.0,
              width: 200.0,
              color: Colors.black,
            ),
            Container(
              height: 100.0,
              width: 200.0,
              color: Colors.green,
            )
          ],
        ),
      )
    );
  }
}