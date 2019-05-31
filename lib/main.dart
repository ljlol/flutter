import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';
import 'package:testapp/app.dart';

void main(List<String> args) {
    runApp(UiApp());
}

class demoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'container grid',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: GridDemo(),
    );
  }
}

class GridDemo extends StatefulWidget {
  @override
  _GridDemoState createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('grid first'),
      ),
      body: Center(
        child: buildGrid(),
      ),
    );
  }

  List<Container> _buildGridTileList(int count){
    return List<Container>.generate(count, (int index) =>
      Container(child: Image.network('https://tvax1.sinaimg.cn//crop.24.0.1194.1194.180/006cFMsrly8fkayogp3itj30yi0x60un.jpg'),)
    );
  }

  Widget buildGrid() {
    return GridView.extent(
      
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      children: _buildGridTileList(30),
    );
  }
}




class UiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var packedRow = new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.black),
        new Icon(Icons.star, color: Colors.black),
      ],
    );

    var ratings = new Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily:'Roboro',
              letterSpacing:0.5,
              fontSize: 20.0,
            )
          )

        ],
      ),
    );

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
    // 所有的子节点继承
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new Icon(Icons.kitchen, color: Colors.green[500]),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.timer, color: Colors.green[500]),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.restaurant, color: Colors.green[500]),
                new Text('FEEDS:'),
                new Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );


    var leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: Column(
        children: <Widget>[
          ratings,
          iconList

        ],
      ),
    );

    return MaterialApp(
      
    
      home: Scaffold(
        appBar: AppBar(
          title: Text('123344'),
        ),

        body: Center(
          child: leftColumn,
        ),
      )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'startup name generator',
      home: RandomWords(),
      
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override

  final _suggestions = <WordPair>[];

  final _saved = Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('startup name generator'),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair){
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
          );

          final divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved suggestions'),
            ),
            body: ListView(children:divided),
          );
        }
      )
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),

      itemBuilder: (context, i){
        if (i.isOdd) {
          return new Divider();
        }

        final index = i ~/ 2;

        if (index>=_suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }


        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){

    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      onTap: (){
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }
}

