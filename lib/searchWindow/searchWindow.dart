import 'package:flutter/material.dart';
import '../classes.dart';
import 'package:http/http.dart' as http;
import '../definitionWindow/definitionWindow.dart';
import 'dart:convert';

Future<UrbanResponse> fetchDef(String term) async {
  final http.Response httpRes =
      await http.get('http://api.urbandictionary.com/v0/define?term=$term');

  if (httpRes.statusCode == 200) {
    final jsRes = json.decode(httpRes.body);
    final parsed = UrbanResponse.fromJson(jsRes);

    if (parsed.list.length == 0) {
      throw Exception('No result found!');
    }
    return parsed;
  } else {
    throw Exception('An error has occured.');
  }
}

class SearchArguments {
  final String query;

  SearchArguments(this.query);
}

class ResultsList extends StatelessWidget {
  final List<Definition> definitions;

  ResultsList({Key key, this.definitions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: definitions.length,
        itemBuilder: (context, index) {
          final Definition def = definitions[index];
          return ListTile(
            title: Text(
                "#$index - by ${def.author} (Score: ${def.thumbsUp - def.thumbsDown})"),
            onTap: () {
              Navigator.pushNamed(context, '/definition',
                  arguments: DefinitionArguments(def));
            },
          );
        });
  }
}

class SearchWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text("Search Results")),
        body: FutureBuilder<UrbanResponse>(
          future: fetchDef(args.query),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text("${snapshot.error}"));
            return snapshot.hasData
                ? ResultsList(definitions: snapshot.data.list)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
