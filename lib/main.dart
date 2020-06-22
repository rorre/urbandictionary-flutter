import 'package:flutter/material.dart';
import 'mainWindow/mainWindow.dart';
import 'searchResult/searchResult.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Urbandictionary',
      initialRoute: '/',
      routes: {
        '/': (context) => MainWindow(),
        '/search': (context) => SearchResult()
      },
    );
  }
}
