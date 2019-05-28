import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(List<String> args) {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'first',
      home: MyHomePage(),
      
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var color = TextStyle(color: Colors.white);
    var avatar = 'https://qcloud.dpfile.com/pc/bMbudG0HNlcgJ9mCH9uT_KG-8Lkov5fWOq0Vw93525g-OrTcCi-L0gXpZGLYEEcFTYGVDmosZWTLal1WbWRW3A.jpg';
    var bgImage = 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3672957379,325248742&fm=26&gp=0.jpg';
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('标题'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Text('金融'),
            Text('医疗'),
            Text('股票'),
            Text('汽车'),
            Text('我的')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Text('浮动按钮'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text('xxx@szj.com',style: color,),
                accountName: Text('szj',style: color,),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://qcloud.dpfile.com/pc/bMbudG0HNlcgJ9mCH9uT_KG-8Lkov5fWOq0Vw93525g-OrTcCi-L0gXpZGLYEEcFTYGVDmosZWTLal1WbWRW3A.jpg'),
                
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(bgImage))
                ),
              ),

              ListTile(
                title: Text('喜欢的'),
                trailing: Icon(Icons.favorite),
              ),
              ListTile(
                title: Text('收藏的'),
                trailing: Icon(Icons.fastfood),
              ),
              ListTile(
                title: Text('个人信息'),
                trailing: Icon(Icons.face),
              )
              
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.lightBlue),
          height: 60.0,
          child: TabBar(
            labelStyle: TextStyle(height: 0.5,fontSize: 12.0),
            tabs: <Widget>[
              Tab(icon: Icon(Icons.memory),text: '金融',),
              Tab(icon: Icon(Icons.money_off),text: '医疗',),
              Tab(icon: Icon(Icons.add_circle,size:52.0,color:Colors.white),),
              Tab(icon: Icon(Icons.high_quality),text: '汽车',),
              Tab(icon: Icon(Icons.airplay),text: '我的',)

            ],
          ),
        ),
      ),
    );
  }
}


