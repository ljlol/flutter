import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel:'menu',
          ),
          onPressed: (){
            Navigator.pop(context);
            print('menu button');
          },
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),

        childAspectRatio: 8.0/9.0,

        children: _buildGridCards(10),
       
      ),
    );
  }

  List<Card> _buildGridCards(int count){
    List<Card> cards = List.generate(count, 
    
    (int index) => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0/11.0,
              child: Image.network('https://tvax3.sinaimg.cn//crop.157.42.159.159.180/81c620cfly8g0fc1gxdmnj20ad0aa74l.jpg'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('title'),
                  SizedBox(height: 8.0,),
                  Text('Secondary Text'),
                ],
              ),
            )
          ],
        ),
      )
    );


    return cards;
  }
}