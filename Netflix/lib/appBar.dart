import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {

  final ScrollController scrollController;
  
  MyAppBar({
    Key key,
    this.scrollController
  }) : super(key: key);

  @override
  _MyAppBar createState() => _MyAppBar();  
}

class _MyAppBar extends State<MyAppBar> {

  double lastScrollOffset = 0.0;
  double opacity = 0.0;
  double height = 80;
  ScrollController controller;
  Color backgroundColor = Color(0xFF090909);

  @override
  void initState() {
    super.initState();
     controller = widget.scrollController..addListener((){
      height = min(80, max(height + (lastScrollOffset - controller.offset), 0));
      opacity = controller.offset < 250 ? controller.offset / 250 : 1.0;     
      
      lastScrollOffset = controller.offset;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {  

    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Positioned(
          child: Container(
            height: height,
            color: Colors.black.withOpacity(opacity),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 25.0)),
                new Row(            
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 5.0)),
                    new Image.network(
                      'https://i0.wp.com/maisclube.com.br/wp-content/uploads/2018/07/Netflix-Logo-png.png',
                      height: height / 2,
                      width: 40.0
                    ),
                    new Expanded(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          appBarText('Séries'),
                          appBarText('Filmes'),
                          appBarText('Minha Lista'),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Text appBarText(title) => new Text(title, style: new TextStyle(color: Colors.white, fontSize: 16));
  double min(double a, double b) => a > b ? b : a;
  double max(double a, double b) => a > b ? a : b;
}