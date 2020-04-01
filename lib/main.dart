import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lockdown_response/screens/addFoodService.dart';
import 'package:lockdown_response/screens/appHome.dart';
// import 'addF';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lock Down Preparedness',
      theme: ThemeData(
          primarySwatch: Colors.purple, scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.purple.shade200,
          appBarTheme: AppBarTheme.of(context).copyWith(color: Theme.of(context).primaryColor)),
      home: AppHomePage(),
      routes: {
        '/addFoodService':(context)=>AddFoodService(),
      }

      
    );
  }
}

