import 'package:flutter/material.dart';
import 'package:hello_world/classes.dart';

class DefinitionArguments {
  final Definition def;

  DefinitionArguments(this.def);
}

Widget createDefinitionWidget(Definition def) {
  return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(def.word, style: TextStyle(fontSize: 20)),
          Text(def.author, style: TextStyle(fontSize: 8)),
          Divider(color: Colors.black),
          Text(def.definition, style: TextStyle(fontSize: 12)),
          Divider(color: Colors.black),
          Text(
            def.example,
            style: TextStyle(fontSize: 12),
          )
        ],
      ));
}

class DefinitionWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DefinitionArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Definition'),
        ),
        body: Center(child: createDefinitionWidget(args.def)));
  }
}
