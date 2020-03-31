import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lockdown_response/screens/appHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lock Down Preparedness',
      theme: ThemeData(
          primarySwatch: Colors.purple, scaffoldBackgroundColor: Colors.white),
      home: AppHomePage(),
    );
  }
}

  //   return StreamBuilder(
  //       stream: Firestore.instance
  //           .collection('cities')
  //           // .where('elevation', isGreaterThan: 10)
  //           .orderBy('timestamp',descending: true)
  //           .snapshots(),
  //       builder: (context, AsyncSnapshot snapshot) {
  //         if (!snapshot.hasData) {
  //           return Center(child: CircularProgressIndicator());
  //         } else {
  //           return ListView.builder(
  //             itemCount: snapshot.data.documents.length,
  //             itemBuilder: (context, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Card(
  //                   elevation: 5,
  //                   child: ListTile(
  //                     title: Text(snapshot.data.documents[index]['Name']),
  //                     subtitle: Text('timestamp: \n' +
  //                         snapshot.data.documents[index]['timestamp']
  //                             .toString()),
  //                     // trailing: Text(snapshot.data.documents[index]['height'].toString()),
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         }
  //       });
  // }
// }
