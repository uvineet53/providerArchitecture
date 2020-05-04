import 'package:flutter/material.dart';
import 'package:helloworld/providers/settings_provider.dart';
import 'package:helloworld/screens/home.dart';
import 'package:helloworld/services/firestore_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirestoreService _db = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SettingsProvider(),
        ),
        StreamProvider(
          create: (BuildContext context) => _db.getReports(),
        )
      ],
      //ADD PROVIDER,
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
