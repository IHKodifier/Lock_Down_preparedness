import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class Violation extends StatefulWidget {
  @override
  _ViolationState createState() => _ViolationState();
}

class _ViolationState extends State<Violation> {
  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              child: Column(
                children: <Widget>[
                  buildMediaPlaceholder(),
                  buildCameraIconButton(context),
                  buildDisclaimer(context),
                  buildUploadButton(context),
                  _buildViolationList(context),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildUploadButton(BuildContext context) {
    if (_image != null) {
      return Padding(
          padding: const EdgeInsets.all(4.0),
          child: RaisedButton(
              onPressed: () {
                // _addDumyViolation();
                _uploadMedia(context);
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

  IconButton buildCameraIconButton(context) {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 50,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        _getImage();
      },
    );
  }

  Widget buildMediaPlaceholder() {
    if (_image != null) {
      return Container(
        height: 100,
        width: 80,
        child: Image.file(
          _image,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Container(
        height: 100,
        width: 80,
        child: Center(child: Text('No media selected')),
      );
    }
  }

  _buildViolationList(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
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
                      title: Text('violation at \"' +
                          snapshot.data.documents[index]['city'] +
                          '\" on ' +
                          _timestamp),
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

  Future _uploadMedia(BuildContext context) async {
    String _fileName = DateTime.now().toString();
    // basename(_image.path);
    StorageReference _storageRef =
        FirebaseStorage.instance.ref().child(_fileName);
    StorageUploadTask _uploadTask = _storageRef.putFile(_image);
    StorageTaskSnapshot _taskSnapshot = await _uploadTask.onComplete;
    setState(() {
      print('*************************************************************');
      print('your image named  \n $_fileName  \n has been saved to firebase\n');
      print('*************************************************************');
    });
  }

  Future _getImage() async {
    var _pickedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = _pickedImage;
      print('image path = $_image');
    });
  }
}
