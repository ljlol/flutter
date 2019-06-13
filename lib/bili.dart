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
            Stack(
              alignment: Alignment(1.0, -1.2),
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                    width: MediaQuery.of(context).padding.top,
                    // height: 30.0,
                  ),
                ),
                Container(
                  width: 9.0,
                  height: 9.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.0)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 17.0, right: 13.0),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 5.0),
              width: 180.0,
              height: 30.0,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
            Image.asset(
              "images/drawable-xhdpi-v4/music_icon_subject.png",
              width: 38.0,
              height: 41.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.settings_applications,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
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
              width: MediaQuery.of(context).size.width - 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("直播"),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
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
                        margin: EdgeInsets.only(top: 5.0),
                        height: 1.0,
                        width: 30.0,
                        color: isVisible ? Colors.redAccent : Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("追番"),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 1.0,
                        width: 30.0,
                        color: isVisible ? Colors.redAccent : Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("国家宝藏"),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 1.0,
                        width: 60.0,
                        color: isVisible ? Colors.redAccent : Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("海贼王"),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 1.0,
                        width: 30.0,
                        color: isVisible ? Colors.redAccent : Colors.white,
                      ),
                    ],
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  child: Image.network(
                    'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                    fit: BoxFit.cover,
                    height: 240.0,
                  ))),
          SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Image.network(
                                'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                                // width: 150.0,
                                height: 50.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text('英雄联盟'),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Image.network(
                                'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                                // width: 150.0,
                                height: 50.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text('英雄联盟'),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Image.network(
                                'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                                // width: 150.0,
                                height: 50.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text('英雄联盟'),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Image.network(
                                'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                                // width: 150.0,
                                height: 50.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text('英雄联盟'),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Image.network(
                                'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                                // width: 150.0,
                                height: 50.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text('英雄联盟'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 2,
              )),
          Container(
            height: 1.0,
            color: Colors.black12,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text('我的关注'),
                ),
                Text(
                  '16小时前',
                  style: TextStyle(color: Colors.black26),
                ),
                Text('xxxxxx'),
                Text(
                  '直播了xx电台',
                  style: TextStyle(color: Colors.black26),
                ),
                Icon(
                  Icons.home,
                  color: Colors.black26,
                )
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.black12,
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('推荐直播'),
                Row(
                  children: <Widget>[
                    Text('换一换'),
                    Icon(
                      Icons.refresh,
                      color: Colors.black26,
                      size: 20.0,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              height: 500.0,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.4),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.0)),
                                      child: Image.network(
                                        'https://tvax2.sinaimg.cn/crop.0.0.750.750.180/005AxgmIly8g1829y7z6bj30ku0kuabc.jpg',
                                        fit: BoxFit.cover,
                                        width: 190.0,
                                        height: 80.0,
                                      )
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('yyf1',style: TextStyle(color: Colors.white),),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.perm_identity,color: Colors.white,),
                                            Text('9.9万人',style: TextStyle(color: Colors.white),)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Text('三局杀戮换游戏呀'),
                          Text(
                            '其他游戏',
                            style: TextStyle(color: Colors.black26),
                          )
                        ],
                      ));
                },
                itemCount: 6,
              )),
        ],
      ),
    );
  }
}
