import 'package:flutter/material.dart';

import 'appBar.dart';
import 'bottomNavigationBar.dart';
import 'horizontalList.dart';

void main() => runApp(MyApp());

const Color BACKGROUND_COLOR = Color(0xFF090909);

class MyApp extends StatelessWidget {

  // Root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: BACKGROUND_COLOR,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        textTheme: new TextTheme(
          caption: TextStyle(color: Colors.white54)
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() => setState(() {}));

  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: new Stack(
        overflow: Overflow.visible,
        children: <Widget> [        
          new ListView(
            controller: _scrollController,    
            children: <Widget>[        
              new Container(
                height: 400.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://www.whats-on-netflix.com/wp-content/uploads/2018/02/seven-deadly-sins-season-2.jpg"),
                  ),
                ),
                child: _buildImageStack()
              ),
              new HorizontalList(links: [
                'https://www.indiewire.com/wp-content/uploads/2017/09/true-memoirs-of-an-international-assassin-2016.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/i-am-the-pretty-thing-that-lives-in-the-house-2016.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/xoxo-2016.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/mascots-2016.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/okja-2017.jpg'
                ], title: 'Populares na Netflix',
              ),
              new HorizontalList(links: [
                'https://www.indiewire.com/wp-content/uploads/2017/09/clinical-2017.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/the-incredible-jessica-james-2017.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/take-the-10-2017.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/win-it-all-2017.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/i-dont-feel-at-home-in-this-world-anymore-2017.jpg'
                ], title: 'Em alta',
              ),
              new HorizontalList(links: [
                'https://www.indiewire.com/wp-content/uploads/2017/09/first-they-killed-my-father-a-daughter-of-cambodia-remembers-2017.jpg',
                'https://m.media-amazon.com/images/M/MV5BMjE4NDc5MDU2NV5BMl5BanBnXkFtZTgwNDI1ODEyNTM@._V1_.jpg',
                'https://m.media-amazon.com/images/M/MV5BMjA3MTE5ODM3M15BMl5BanBnXkFtZTgwNTIyMjQ5NTM@._V1_.jpg  ',
                'https://www.indiewire.com/wp-content/uploads/2017/09/mascots-2016.jpg',
                'https://www.indiewire.com/wp-content/uploads/2017/09/okja-2017.jpg'
                ], title: 'Séries dos EUA',
              ),
            ] 
          ),
          MyAppBar(scrollController: _scrollController),           
        ]
      ),
      bottomNavigationBar: new MyBottomNavigationBar(),
    );
  }

  Widget _buildImageStack() => new Stack(
      children: <Widget>[      
        new Positioned(
          bottom: 20.0,
          width: 410.0,
          child: Container( 
            margin: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.white, size: 42.0),
                    Text('Minha lista', style: TextStyle(color: Colors.white))
                  ],
                ),
                Container(
                  height: 40.0,
                  width: 95.0,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.play_arrow),
                      Text('Assistir')
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.info_outline, color: Colors.white, size: 42.0),
                    Text('Minha lista', style: TextStyle(color: Colors.white))
                  ],
                ),
              ],
            ),
          )
        )
      ],
    );

  List buildTextViews(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(padding: new EdgeInsets.all(16.0),
          child: new Text("Item number " + i.toString(),
              style: new TextStyle(fontSize: 20.0, color: Colors.white))));
    }
    return strings;
  }
}

/* import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()
      ..addListener(() {
        if (controller.offset >= 257)
          opacity = 1;
        else
          opacity = controller.offset / 257;
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
        children: <Widget>[
          ListView(
            controller: controller,
            children: <Widget>[
              Image.network(
                "https://http2.mlstatic.com/cartaz-personalizados-para-festa-solicite-orcamento-D_NQ_NP_702960-MLB26754814338_022018-F.jpg",
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://designportugal.net/wp-content/uploads/2015/02/Cartaz-Conservat%C3%B3rio-frente.jpg",
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://http2.mlstatic.com/cartaz-personalizados-para-festa-solicite-orcamento-D_NQ_NP_702960-MLB26754814338_022018-F.jpg",
                fit: BoxFit.cover,
              ),
            ],
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Container(
                width: double.infinity,
                height: 100,
                color: Colors.black.withOpacity(opacity),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: <Widget>[
                  Text("Menu 1", style: TextStyle(color: Colors.white, fontSize: 25),),
                  Text("Menu 2", style: TextStyle(color: Colors.white, fontSize: 25),),
                  Text("Menu 3", style: TextStyle(color: Colors.white, fontSize: 25),),
                ],),
              );
            },
          ),
        ],
      ),
    );
  }
} */
