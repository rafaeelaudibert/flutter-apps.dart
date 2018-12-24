import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
      child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Inicio"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text("Buscas"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.play_circle_outline),
            title: new Text('Em Breve'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.file_download),
            title: new Text('Downloads'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.menu),
            title: new Text('Mais')
          )
        ],
      )
    );
  }
}