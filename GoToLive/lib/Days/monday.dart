import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:google_fonts/google_fonts.dart';

class Monday extends StatefulWidget {
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  var subjectNameController = TextEditingController();
  var linkController = TextEditingController();
  var _dateTime;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    String title = arguments['title'];

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ]),
            ),
          ),
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.architectsDaughter(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add,
              size: 40,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ]),
            ),
          ),
          onPressed: () {
            _showInputForm(context);
          },
        ));
  }

  _showInputForm(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            children: [
              Text("Please fill out the form"),
              Expanded(
                  child: TextField(
                autofocus: true,
                autocorrect: true,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: "Subject Name*",
                ),
                controller: subjectNameController,
              )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ]),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: TextStyle(fontSize: 24, color: Colors.black),
                  highlightedTextStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  spacing: 30,
                  itemHeight: 60,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      _dateTime = time;
                      print(time);
                    });
                  },
                ),
              )),
              Expanded(
                  child: TextField(
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  labelText: "Class room link*",
                ),
                controller: linkController,
              )),
            ],
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  subjectNameController.clear();
                  linkController.clear();
                },
                child: Text("Cancel")),
            FlatButton(onPressed: () {}, child: Text("Save"))
          ],
        ));
  }
}
