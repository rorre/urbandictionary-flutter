import 'package:flutter/material.dart';
import '../searchWindow/searchWindow.dart';

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchForm());
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
    final searchField = TextFormField(
      controller: searchController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a search query';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Search query',
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final searchButton = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.blueAccent.shade100,
          child: MaterialButton(
            height: 42.0,
            color: Colors.blueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, '/search',
                    arguments: SearchArguments(searchController.text));
              }
            },
            child: Text('Search'),
          ),
        ));

    final logo = Hero(
      tag: "hero",
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    return Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              logo,
              searchField,
              searchButton,
            ],
          ),
        ));
  }
}
