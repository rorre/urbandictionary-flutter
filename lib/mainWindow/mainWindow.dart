import 'package:flutter/material.dart';
import 'package:hello_world/searchResult/searchResult.dart';

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Urbandictionary')
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: SearchForm(),
        )
      );
  }
}

class SearchForm extends StatefulWidget {
  @override
  SearchFormState createState() {
    return SearchFormState();
  }
}

class SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: searchController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a search query';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(
                    context,
                    '/search',
                    arguments: ScreenArguments(searchController.text)
                  );
                }
              },
              child: Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}
