import 'package:flutter/material.dart';
import 'package:world_time/Screens/home.dart';
import 'package:world_time/Screens/loading.dart';
import 'package:world_time/Screens/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey   
        ),
        initialRoute: '/Loading',
        routes: {
          '/Loading':(context) => Loading(),
          '/Home':(context) => Home(),
          '/Location':(context) => Location()
        },
      ); 
  }
}