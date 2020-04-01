import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrowseFoodServices extends StatefulWidget {
  @override
  _BrowseFoodServicesState createState() => _BrowseFoodServicesState();
}

class _BrowseFoodServicesState extends State<BrowseFoodServices> {
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
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('cities')
              .orderBy('city')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Card(
                          // color: Colors.white70,
                          elevation: 5,

                          child: ListTile(
                            leading: _buildProvinceAvatar(context,
                                snapshot.data.documents[index]['admin']),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    snapshot.data.documents[index]['city'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ),
                                _buildPopulation(
                                    context, snapshot.data.documents[index]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (){}),
    );
  }

  var _colorSelector = {
    'KP': Colors.orange.shade200,
    'BL': Colors.purple.shade100,
    'PU': Colors.teal.shade300,
    'GB': Colors.red.shade400,
    'AJK': Colors.blue.shade300,
    'SN': Colors.pink.shade300,
    'ICT': Colors.blueAccent,
  };

  _buildProvinceAvatar(BuildContext context, String province) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 50,
        width: 50,
        color: _colorSelector[province],
        child: Center(
          child: Text(
            province,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  _buildPopulation(BuildContext context, DocumentSnapshot snapshot) {
    if (snapshot['population'] == '') {
      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Text(
          'population :not available',
          style: Theme.of(context).textTheme.subtitle.copyWith(
              fontStyle: FontStyle.italic, fontSize: 14, color: Theme.of(context).accentColor),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Text(
          'population: ' + snapshot['population'],
          style: Theme.of(context).textTheme.subtitle.copyWith(
              fontStyle: FontStyle.italic, fontSize: 14, color: Theme.of(context).accentColor),
        ),
      );
    }
  }
}
