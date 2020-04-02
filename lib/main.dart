import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
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
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.purple.shade100,
          appBarTheme: AppBarTheme.of(context)
              .copyWith(color: Theme.of(context).primaryColor),
          buttonTheme: const ButtonThemeData().copyWith(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            textTheme: ButtonTextTheme.primary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            counterStyle: GoogleFonts.roboto(color: Colors.black),
          ),
        ),
        home: AppHomePage(),
        routes: {
          '/addFoodService': (context) => AddFoodService(),
        });
  }
}
