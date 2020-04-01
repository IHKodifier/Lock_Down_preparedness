import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFoodService extends StatefulWidget {
  @override
  _AddFoodServiceState createState() => _AddFoodServiceState();
}

class _AddFoodServiceState extends State<AddFoodService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 2.0,
        title: Text(
          'Food/ ration services',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(child: Text('Add food service')),
    );
  }
}
