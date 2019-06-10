import 'package:flutter/material.dart';

class biliPage extends StatefulWidget {
  @override
  _biliPageState createState() => _biliPageState();
}

class _biliPageState extends State<biliPage> {
  
  bool isVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            ClipOval(
              child: Image.network('https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                width: MediaQuery.of(context).padding.top,
                // height: 30.0,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 13.0,right: 13.0),
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
            
            Image.asset("images/drawable-xhdpi-v4/music_icon_subject.png",
              width: 38.0,
              height: 41.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(Icons.settings_applications,color: Colors.white,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(Icons.message,color: Colors.white,),
            ),

           
        

          ],
        ),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 23.0),
            color: Colors.white,
            alignment: Alignment.center,
            height: 50.0,
            width: MediaQuery.of(context).size.width-50,
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("直播"),
                    Container(
                      margin: EdgeInsets.only(top:5.0),
                      height: 1.0,
                      width: 30.0,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("推荐"),
                    Container(
                      margin: EdgeInsets.only(top:5.0),
                      height: 1.0,
                      width: 30.0,
                      color: isVisible? Colors.redAccent:Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("追番"),
                    Container(
                      margin: EdgeInsets.only(top:5.0),
                      height: 1.0,
                      width: 30.0,
                      color: isVisible? Colors.redAccent:Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("国家宝藏"),
                    Container(
                      margin: EdgeInsets.only(top:5.0),
                      height: 1.0,
                      width: 60.0,
                      color: isVisible? Colors.redAccent:Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("海贼王"),
                    Container(
                      margin: EdgeInsets.only(top:5.0),
                      height: 1.0,
                      width: 30.0,
                      color: isVisible? Colors.redAccent:Colors.white,
                    ),
                  ],
                ),

                
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: 
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              child: Image.network('https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
              fit: BoxFit.cover,
              height: 240.0,)
            )
          ),
          SizedBox(
            height: 200.0,
            child: 
              ListView.builder(itemBuilder: (context,index){
                return Container(
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.network('https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                            width: 150.0,
                            height: 50.0,
                          ),
                          Text('英雄联盟')
                        ],
                      )
                    ],
                  ),
                );
              },itemCount: 5,)

          ),


          
        ],
      ),
    );
  }
}