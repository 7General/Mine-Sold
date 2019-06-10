import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mine_sold/app/root_scene.dart';


class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'MINE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Colors.red,
        scaffoldBackgroundColor: Colors.red,
        textTheme: TextTheme(body1: TextStyle(color: Colors.red))
      ),
      home: RootScene(),
    );
  }
}