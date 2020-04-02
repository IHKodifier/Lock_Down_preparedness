import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class AddFoodService extends StatefulWidget {
  @override
  _AddFoodServiceState createState() => _AddFoodServiceState();
}

class _AddFoodServiceState extends State<AddFoodService> {
  List<String> _cityList;
  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          _buildNameField(localTheme),
          SizedBox(height: 20),
          _buildPhoneNumber(localTheme),
          // _buildCityDropDown(localTheme),
        ],
      ),
    );
  }

  TextField _buildPhoneNumber(ThemeData localTheme) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.phone_android,size:30,color: Theme.of(context).primaryColor,),
        border: localTheme.inputDecorationTheme.border,
        hintText: 'Phone',
        hintStyle: localTheme.textTheme.subhead.copyWith(
          fontSize: 16.0,
          color: Colors.black54,
          fontStyle: FontStyle.italic,
        ),
        labelText: 'Phone number',
        labelStyle: localTheme.textTheme.title.copyWith(
          color: localTheme.primaryColor,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Container _buildNameField(ThemeData localTheme) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle,size:30,color: Theme.of(context).primaryColor,),
          border: localTheme.inputDecorationTheme.border,
          hintText: 'Name of person or trust etc.',
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
          labelText: 'Name',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  _buildCityDropDown(ThemeData localTheme) {
    // return DropdownButton<String>(
    //   items: _cityList.map(cityname)=>DropdownMenuItem<String>(value: cityname,
    //   child: Text(cityname),).,
    // );
    }
/*
.map((title) => Tab(text: title)).toList()

DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
*/
  Future<List<String>> _getCities ()async {
      
    Firestore.instance.collection('cities').getDocuments().then((snapshot){
       for (int i=0;i<snapshot.documents.length;i++) {
                _cityList.add(snapshot.documents[i]['city']);
       }
return _cityList;

     });

  } 
}
