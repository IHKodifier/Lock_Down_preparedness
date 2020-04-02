import 'package:flutter/material.dart';
import 'package:lockdown_response/screens/violation.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'foodservices.dart';

class FoodSupport extends StatefulWidget {
  @override
  _FoodSupportState createState() => _FoodSupportState();
}

class _FoodSupportState extends State<FoodSupport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                      'On this page  you can \n (a)  ADD \"FREE\" services that provide food/ ration for the destitute during this  lockdown \n (b) search for available services'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowseFoodServices()));
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Browse  Services by city',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _uploadData(BuildContext context) async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/pkcities.json');
    List<dynamic> _raw = jsonDecode(jsonString);
    _raw.forEach((element) {
      Firestore.instance.collection('/cities').add(element);
      print(element['city'] + ' has been saved to firestore\n');
    });

    print(jsonString);
  }
}
