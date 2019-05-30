import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';
import 'package:testapp/app.dart';

void main(List<String> args) {
    runApp(ShrineApp());
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

