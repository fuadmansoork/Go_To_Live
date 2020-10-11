import 'package:GoToLive/database/db.dart';
import 'package:flutter/material.dart';

import 'input.dart';

class Monday extends StatefulWidget {
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  var future = DatabaseHelper.instance.query("monday");
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputForm(),
              ));
        },
      ),
    );
  }
}
