import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenArguments {
  final String query;

  ScreenArguments(this.query);
}

Future<Definition> fetchDef(String term) async {
  final http.Response http_res =
      await http.get('http://api.urbandictionary.com/v0/define?term=$term');

  if (http_res.statusCode == 200) {
    final js_res = json.decode(http_res.body);

    if (js_res['list'].length == 0) { throw Exception('No result found!'); }
    return Definition.fromJson(js_res['list'][0]);
  } else {
    throw Exception('An error has occured.');
  }
}

class Definition {
  final int id;
  final String term;
  final String definition;
  final String example;
  final String author;
  final String url;

  Definition(
      {this.id,
      this.term,
      this.definition,
      this.example,
      this.author,
      this.url});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      id: json['defid'],
      term: json['word'],
      definition: json['definition'],
      example: json['example'],
      author: json['author'],
      url: json['permalink'],
    );
  }
}

Widget createDefinitionWidget(Definition def) {
  return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(def.term, style: TextStyle(fontSize: 20)),
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

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Search Result'),
            ),
            body: Center(
                child: FutureBuilder<Definition>(
                    future: fetchDef(args.query),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return createDefinitionWidget(snapshot.data);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return CircularProgressIndicator();
                    }))));
  }
}
