import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Violation extends StatefulWidget {
  @override
  _ViolationState createState() => _ViolationState();
}

class _ViolationState extends State<Violation> {
  bool _fileSelected;

  @override
  void initState() {
    super.initState();
    _fileSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Column(
              children: <Widget>[
                buildMediaPlaceholder(),
                buildCameraIconButton(),
                buildDisclaimer(context),
                buildUploadButton(context),
                _buildViolationList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildUploadButton(BuildContext context) {
    if (_fileSelected == true) {
      return Padding(
          padding: const EdgeInsets.all(4.0),
          child: RaisedButton(
              onPressed: () {
                _addDumyViolation();
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'Upload & Report Lock Down Violation',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )));
    } else
      return Container();
  }

  Padding buildDisclaimer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Text(
        'Your device\'s location information will also be added to the violation report\n\n All violation reports are Anonymous\n',
        style: Theme.of(context)
            .textTheme
            .subhead
            .copyWith(color: Colors.grey, fontStyle: FontStyle.italic),
      ),
    );
  }

  IconButton buildCameraIconButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 50,
      ),
      onPressed: () {
        setState(() {
          _fileSelected = !_fileSelected;
        });
      },
    );
  }

  Widget buildMediaPlaceholder() {
    if (_fileSelected == true) {
      return Placeholder(
        fallbackHeight: 120,
      );
    } else {
      return SizedBox(
        height: 120,
      );
    }
  }

  _buildViolationList() {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      // width: 350,
      child: StreamBuilder(
        stream: Firestore.instance.collection('violations').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return Container(
              // color: Colors.yellow,
              width: 230,
              constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  Timestamp st = snapshot.data.documents[index]['timestamp'];
                  DateTime dt = st.toDate();
                  String _timestamp = dt.toString();
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text('violation at Islamabad  on ' + _timestamp),
                    ),
                  );
                  // Times
                },
              ),
            );
          }
        },
      ),
    );
  }

  void _addDumyViolation() {
    Firestore.instance
        .collection('violations')
        .add({'timestamp': DateTime.now(), 'city': 'Islamabad'});
  }
}
