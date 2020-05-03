import 'package:flutter/material.dart';
import 'package:helloworld/providers/settings_provider.dart';
import 'package:helloworld/screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(), //ADD PROVIDER,
      child: MaterialApp(
        title: 'Wax App',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.deepOrangeAccent),
        home: Home(),
      ),
    );
  }
}
