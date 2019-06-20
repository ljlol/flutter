import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var editerTextController = TextEditingController();
  var mTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textEdit'),
      ),
      body: ListView(
        children: <Widget>[
          // TODO 基本输入框
          Container(
              margin: EdgeInsets.all( 20.0),
              padding: EdgeInsets.only(left: 20.0),
              alignment: Alignment.center,
              width: 200.0,
             
              height: 40.0,
              child: Row(
                children:<Widget>[ 
                  Icon(Icons.access_alarm),
                  Container(
                    alignment: Alignment.center,
                    height: 36.0,
                    width: 200.0,
                    child:
                      EditableText(
                        controller: editerTextController,
                        focusNode: FocusNode(),
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.blue,
                        backgroundCursorColor: Colors.red,
                        onChanged: (result){
                          print(result);
                        },
                        textInputAction: TextInputAction.emergencyCall,
                      ),
                  ),
                ]
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            width: 200.0,
            height: 40.0,
            child: TextField(
              controller: mTextFieldController,
              focusNode: FocusNode(),
              decoration: InputDecoration(
              
                labelText: '请输入',
                labelStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.accessibility_new),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
