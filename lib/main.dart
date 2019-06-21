import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:testapp/app.dart';
import 'bili.dart';
import 'EditTextWidget.dart';
import 'ListWidgt.dart';

void main(List<String> args) {
    runApp(FirstDemo());
}

class FirstDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.redAccent),
      title: 'demo',
      home: TextPage(),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      title: 'Login demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: LoginHomePage(), 
    );
  }
}


class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> _pageIndicators = ['登录', '注册'];

  List<Widget> _pages = [];

  int _position = 0;

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.pink,iconTheme: IconThemeData(color: Colors.pink)),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/drawable-xhdpi-v4/ic_card_personal_foreign.png'),fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    indicatorWeight: 4.0,
                    indicatorColor: Colors.white,
                    tabs: _pageIndicators.map((v) => Text(v,style: TextStyle(color: Colors.white, fontSize: 24.0),)).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:30.0),
                    child: SizedBox(
                      child: IndexedStack(
                        children: _pages,
                        index: _position,
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {

  TextEditingController _editController = TextEditingController();
  FocusNode _editNode = FocusNode();

  String _content = '';
  String _spyContent = '';

  @override
  void initState(){
    super.initState();

    _editNode.addListener((){
      print('edit has focus? => ${_editNode.hasFocus}');
    });
  }

  @override
  void dispose() {
    // 记得销毁，防止内存溢出
    _editController.dispose();
    _editNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('input content'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _editController,
              focusNode: _editNode,
              decoration: InputDecoration(
                icon: Icon(Icons.phone_iphone,color: Theme.of(context).primaryColor,),
                labelText: '请输入手机号',
                helperText: '手机号',
                hintText: '手机号。。。在这输入'
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.redAccent,fontSize: 18.0),
              textDirection: TextDirection.ltr,
              maxLength: 11,
              maxLengthEnforced: true,
              onChanged: (v){
                setState(() {
                  _spyContent = v;
                });
              },
              onSubmitted: (s){
                setState(() {
                  _spyContent = _editController.value.text;
                });
              },
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: 
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _content = _editController.value.text;
                  });

                  _editController.clear();

                  setState(() {
                    _spyContent = '';
                  });
                },

                child: Text('获取输入内容'),

                )
            ),



            Text(_content.isNotEmpty?'获取到输入内容： $_content' :'还未获取到任何内容...'),

            Padding(
              padding:EdgeInsets.symmetric(vertical: 8.0),
              child: Text('我是文字内容监听：$_spyContent'),
            )
            
          ],
        ),
      ),
    );
  }
}

class TabChangePage extends StatelessWidget {

  final String content;

  const TabChangePage({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child:
      Container(
        alignment: Alignment.center,
          child: Text(content,style:TextStyle(color: Theme.of(context).primaryColor,fontSize:30.0)),
      )
    );
  }
}

class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> with SingleTickerProviderStateMixin {

  List<String> _abs = ['A', 'B', 'S'];

  TabController _tabController;

  PageController _pageController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: _abs.length, vsync: this);

    _pageController = PageController(initialPage: 0);

    _tabController.addListener((){
      if(_tabController.indexIsChanging){
        _pageController.animateToPage(_tabController.index,
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu,color: Colors.lightBlue, size: 30.0,),
        title: Text('hello'),
        actions: <Widget>[
          PopupMenuButton(
            offset: Offset(50.0, 100.0),
            onSelected: (val) => print('select item is $val'),
            icon: Icon(Icons.more_vert,color:Colors.yellowAccent),
            itemBuilder: (context) =>
              List.generate(_abs.length, (index) => PopupMenuItem(value: _abs[index],child:Text(_abs[index])))
          )
        ],
        bottom: TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          isScrollable: false,
          indicatorColor: Colors.yellow,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5.0,
          tabs: List.generate(_abs.length, (index)=> Tab(text: _abs[index], icon: Icon(Icons.android),))
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            child: Text('Drawer',style:TextStyle(color: Theme.of(context).primaryColor,fontSize:30.0)),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.android,size: 30.0,
              color: Theme.of(context).primaryColor,),
              onPressed:(){}
            ),
            IconButton(icon: Icon(Icons.people,size: 30.0,
              color: Theme.of(context).primaryColor,),
              onPressed:(){}
            ),

          ],
        ),
      ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: ()=> print('Add'),
          child: Icon(Icons.add, color: Colors.white),
          
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: PageView(
        controller: _pageController,
        children: 
          _abs.map((str) => TabChangePage(content: str,)).toList(),
        onPageChanged: (position){
          _tabController.index = position;
        },
      ),

      // body: TabChangePage(content: 'Content',),

      
    );
  }
}



class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list控件',
      home: GridLayout(),
    );
  }
}


class GridLayout extends StatelessWidget {

  String url =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
      "3408544765&fm=27&gp=0.jpg";

  List<Widget> buildGridTileList(int number){
    return List<Widget>.generate(
      number, (int index) =>
        Container(child: Image.network(url),)
      );
  }

  Widget buildGrid(){
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(20.0),
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      children: buildGridTileList(5),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: buildGrid(),
    );
  }
}

class ListLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
      ),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: buildItem,
      ),
    );
  }

  Widget buildItem(BuildContext context,int index){
    if(index.isOdd) return Divider();

    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0
    );

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('listView',style:textStyle),
    );
  }
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

