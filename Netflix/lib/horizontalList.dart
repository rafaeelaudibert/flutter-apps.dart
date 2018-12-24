import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {

  final List links;
  final String title;

  const HorizontalList({
    Key key,
    @required this.links,
    @required this.title,
  }) : super(key: key);

  @override
  _HorizontalList createState() => _HorizontalList();  
}

class _HorizontalList extends State<HorizontalList> {

  @override
  Widget build(BuildContext context) {

    return new Container(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(widget.title, style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
          new Padding(padding: EdgeInsets.only(bottom: 5.0)),
          new Container(
            height: 200.0,
            child: buildListView(),
          ),

        ],
      )
    );
  }

  ListView buildListView() {
    List<Widget> children = List();

    for (var link in widget.links) {
      children.add(Container(
                padding: EdgeInsets.only(right: 15.0),
                child: Image(image: NetworkImage(link))
              ));      
    }

    return ListView(
            scrollDirection: Axis.horizontal,
            children: children,
          );
  }
}