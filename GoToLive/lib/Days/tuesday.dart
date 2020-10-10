import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:google_fonts/google_fonts.dart';

class Tuesday extends StatefulWidget {
  @override
  _TuesdayState createState() => _TuesdayState();
}

class _TuesdayState extends State<Tuesday> {
  var subjectNameController = TextEditingController();
  var linkController = TextEditingController();
  var _dateTime;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
  }

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
              ListTile(
                title: Text('Set Time'),
                trailing: Icon(Icons.timer),
                onTap: _pickTime,
              ),
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

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }
}
