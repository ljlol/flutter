import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      home: promptDme(),
      // routes: {'/':(_)=> APage(),'/page_b':(_)=> BPage(),'/page_c':(_)=>CPage()},
    );
  }
}


class promptDme extends StatefulWidget {
  @override
  _promptDmeState createState() => _promptDmeState();
}

class _promptDmeState extends State<promptDme> {

  var count = 0;

  @override
  void initState(){
    super.initState();
  }


  @override
  void dispose(){
    super.dispose();
  }

  // 自增操作
  increase() {
    setState(() => count++);
  }

  // 自减操作
  decrease() {
    setState(() => count--);
  }

  _changeValue(BuildContext context){
    increase();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('当前值已修改'),action: SnackBarAction(label: '撤销',onPressed: decrease,),duration: Duration(milliseconds: 2000),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prompt demo'),
      ),
      body: Column(
        children: <Widget>[
          Text('当前值：$count',style: TextStyle(fontSize: 20.0),),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
              children: <Widget>[
                Builder(
                  builder: (context) => RaisedButton(
                    onPressed: () => _changeValue(context),
                    child: Text('修改当前值'),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => _changeValue(context),
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}


class SliverPage extends StatelessWidget {

  final List<Color> colors = [Colors.red,Colors.green,Colors.blue,Colors.pink];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text('Sliver demo'),
          centerTitle: true,
          expandedHeight: 300.0,
          forceElevated: true,
          // floating: true,
          // 该属性只有在 floating 为 true 的情况下使用，不然会报错
          // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
          // 当下滑到一定比例，会自动把 AppBar 展开
          // snap: true,
          // 设置该属性使 Appbar 折叠后不消失
          pinned: true,
          // 通过这个属性设置 AppBar 的背景
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Image.network('https://wx2.sinaimg.cn/mw690/9e5389bbly1g4jkbkp9pmj20u01hc7t3.jpg',fit: BoxFit.cover,),
          ),


        ),
        SliverFillViewport(
          viewportFraction: 1.0,
          delegate: SliverChildBuilderDelegate(
            (context,index) => Container(
              child: Text('Item $index') ,
              alignment: Alignment.center,
              color: colors[index % 4],
              
            ),
            childCount:10
          ),
        )
        // SliverFillRemaining(
        //   child: Center(
        //     child: Text('FillRemaining',style: TextStyle(fontSize: 30.0),),
        //   ),
        // )
      ]),
    );
  }
}

class GridPage extends StatelessWidget {
  final List<String> letters = ['1','23','4','5','6','7','8','9','0','9','8','7','6','5','4','3','2'];

  final List<Color> colors = [Colors.red,Colors.green,Colors.blue,Colors.pink];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid demo'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, //单行的数量
          mainAxisSpacing: 10.0, // item之间主轴方向的间隔
          crossAxisSpacing: 10.0, //item之间副轴的间隔
          childAspectRatio: 1.0 //item的宽高比
        ),
        children: List.generate(
          letters.length, (index)=>Container(alignment: Alignment.center,child: Text(letters[index]),color: colors[index % 4],)
      ),
    )
    );
  }
}

class SingleChildScrollDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<String> letters = ['1','23','4','5','6','7','8','9','0','9','8','7','6','5','4','3','2'];

    return Scaffold(
      appBar: AppBar(
        title: Text('single child demo'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            children: List.generate(letters.length, 
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  letters[index],
                  style:TextStyle(fontSize: 18.0)
                ),
                
              )
            ),
          ),
        ),
      ),
    );
  }
}

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page a'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context,anim,_) => BPage(),
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder: (context,anim,_,child) => ScaleTransition(
                  scale: Tween(begin: 0.0,end: 1.0).animate(anim),
                  child: child,
                )
              )
            );
          },
          child: Text('to page b'),
        ),
      ),
    );
  }
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page b'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){},
              child: Text('to page c'),
    
            ),
            RaisedButton(
              onPressed: (){},
              child: Text('back page a'),
            )
          ],
        )
      ),
    );
  }
}

class CPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page c'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){},
              child: Text('back last page'),
            )
          ],
        ),
      ),
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
    _tabController = TabController(length: _pageIndicators.length,vsync: this);

    _pages..add(LoginPage())..add(RegisterPage());

    _tabController.addListener((){
      if(_tabController.indexIsChanging)
      {
        setState(() {
          _position = _tabController.index;
        });
      }
    });
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
            // image: DecorationImage(image: Image.asset('images/drawable-xhdpi-v4/search_loading_0.png'),fit: BoxFit.cover),
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
                    indicatorColor: Colors.black,
                    tabs: _pageIndicators.map((v) => Text(v,style: TextStyle(color: Colors.black, fontSize: 24.0),)).toList(),
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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  _login(){
    // 取消焦点
    FocusScope.of(context).requestFocus(FocusNode());

    if(_formKey.currentState.validate()){
      var username = _usernameController.value.text;
      var password = _passwordController.value.text;

      if(username == '111' && password == '123123'){
        Fluttertoast.showToast(msg:'登陆成功');
      }else{
        Fluttertoast.showToast(msg:'登录失败');
      }
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Form(

      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: TextFormField(
              controller: _usernameController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.verified_user,size: 24.0,color: Colors.black,),
                labelText: '请输入用户名',
                labelStyle: TextStyle(color: Colors.black),
                helperStyle: TextStyle(color: Colors.black)

              ),

              validator: (value) => value.trim().isEmpty?'用户名不能为空': null,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              style: TextStyle(color: Colors.black,fontSize: 16.0),
              decoration: InputDecoration(
                icon: Icon(Icons.panorama,size: 24.0,color: Colors.black,),
                labelText: '请输入密码',
                labelStyle: TextStyle(color: Colors.black),
                helperStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) => value.trim().length<6?'密码长度不能小于6位':null,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
                onPressed: _login,
                child: Text(
                  '登陆',
                  style:TextStyle(color: Colors.black,fontSize: 20.0)
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: TextFormField(
              obscureText: true,
              controller: _usernameController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.add_photo_alternate,size:24.0,color:Colors.black),
                labelText: '请输入用户名',
                labelStyle: TextStyle(color: Colors.black),
                helperStyle: TextStyle(color: Colors.black)
              ),
              validator: (value) => value.trim().isEmpty?'用户名不能为空':null,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.add_a_photo,size:24.0,color:Colors.black),
                labelText: '请输入密码',
                labelStyle: TextStyle(color: Colors.black),
                helperStyle: TextStyle(color: Colors.black)
              ),

              validator: (value) => value.trim().length<6?'密码不能小于6位':null,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: TextFormField(
              obscureText: true,
              controller: _confirmController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.desktop_windows,size:24.0,color:Colors.black),
                labelText: '请确认密码',
                labelStyle: TextStyle(color: Colors.black),
                helperStyle: TextStyle(color: Colors.black)
              ),

              validator: (value) => value.trim().length<6?'密码不能小于6位':null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
                onPressed: (){},
                child: Text(
                  '注册',
                  style:TextStyle(color: Colors.black,fontSize: 20.0)
                ),
              ),
            ),
          )
        ],
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
          unselectedLabelColor: Colors.black,
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
          child: Icon(Icons.add, color: Colors.black),
          
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

