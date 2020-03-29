import 'package:flutter/material.dart';

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
  
              Padding(
  
                padding: const EdgeInsets.all(12.0),
  
                child: RaisedButton(
  
                  onPressed: () {},
  
                  color: Theme.of(context).primaryColor,
  
                  child: Text(
  
                    'Register a destitute person/family',
  
                    style: TextStyle(color: Colors.white,
  
                    fontSize: 16),
  
                  ),
  
                ),
  
              ),
  
              SizedBox(
  
                height: 20,
  
              ),
  
              Padding(
  
                padding: const EdgeInsets.all(12.0),
  
                child: RaisedButton(
  
                  onPressed: () {},
  
                  color: Theme.of(context).primaryColor,
  
                  child: Text(
  
                    'Browse for Food Support Services',
  
                    style: TextStyle(color: Colors.white,fontSize: 16),
  
                  ),
  
                ),
  
              ),
  
            ],
  
          ),
],
      ),
    );
  }
}
