import 'package:flutter/material.dart';

class biliPage extends StatefulWidget {
  @override
  _biliPageState createState() => _biliPageState();
}

class _biliPageState extends State<biliPage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            ClipOval(
              child: Image.network('https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                width: MediaQuery.of(context).padding.top,
                // height: 30.0,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 13.0),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 5.0),
              width: 180.0,
              height: 30.0,
              
              child: Icon(Icons.search,color: Colors.white,),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}