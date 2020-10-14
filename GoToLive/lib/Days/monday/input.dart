import 'package:GoToLive/database/db.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InputForm extends StatefulWidget {
  final String day;

  const InputForm({Key key, this.day}) : super(key: key);
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _scrollcontroller = ScrollController();
  String timeText = "";
  var meridian = "am";
  var subjectController = TextEditingController();
  var linkController = TextEditingController();
  var hourController = TextEditingController();
  var minuteController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  var Subject = "";
  String url = "";
  String day = "";
  var hour = "";
  var minute = "";
  var time = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
          colors: [
            Colors.grey[500],
            Colors.grey[600],
          ],
        )),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: Scrollbar(
              controller: _scrollcontroller,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller: _scrollcontroller,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: TextFormField(
                                    maxLength: 25,
                                    onChanged: (value) {
                                      Subject = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please enter a subject name";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[700])),
                                      labelText: "Subject Name",
                                      labelStyle: TextStyle(fontSize: 15),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      url = value;
                                      print(url);
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700])),
                                        labelText:
                                            "Paste your class room link here",
                                        labelStyle: TextStyle(fontSize: 15),
                                        hintText: "https://example.com",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      height: 100,
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                              child: TextFormField(
                                            onChanged: (value) {
                                              hour = value;
                                            },
                                            keyboardType:
                                                TextInputType.datetime,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Time";
                                              }
                                              if (int.parse(value) <= 0 ||
                                                  int.parse(value) > 12) {
                                                return "Invalid";
                                              }
                                            },
                                            maxLength: 2,
                                            decoration: InputDecoration(
                                              hintText: "HH",
                                              contentPadding:
                                                  EdgeInsets.only(left: 15),
                                              counterText: "",
                                              border: OutlineInputBorder(),
                                            ),
                                          )),
                                          Flexible(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Text(
                                              ":",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                          Expanded(
                                              child: TextFormField(
                                            keyboardType:
                                                TextInputType.datetime,
                                            onChanged: (value) {
                                              minute = value;
                                            },
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Time";
                                              }
                                              if (int.parse(value) > 59 ||
                                                  int.parse(value) < 0) {
                                                return "Invalid";
                                              }
                                            },
                                            maxLength: 2,
                                            decoration: InputDecoration(
                                              hintText: "MM",
                                              counterText: "",
                                              contentPadding:
                                                  EdgeInsets.only(left: 15),
                                              border: OutlineInputBorder(),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: ToggleSwitch(
                                        activeBgColor: Colors.grey[800],
                                        inactiveBgColor: Colors.grey[400],
                                        cornerRadius: 8,
                                        changeOnTap: true,
                                        minWidth: 45,
                                        initialLabelIndex: 0,
                                        labels: ["AM", "PM"],
                                        onToggle: (index) {
                                          print('switched to: $index');
                                          if (index == 0) {
                                            meridian = "am";
                                          } else {
                                            meridian = "pm";
                                          }
                                          print(meridian);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FlatButton(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 18),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            subjectController.clear();
                                            linkController.clear();
                                            minuteController.clear();
                                            hourController.clear();
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          validate();
                                        },
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ])),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    if (_formKey.currentState.validate()) {
      if (meridian == "pm" && int.parse(hour) != 12) {
        hour = (int.parse(hour) + 12).toString();
        // print(hour);
      }
      if (hour[0] != "0" && int.parse(hour) < 10) {
        hour = "0" + hour;
      }
      if (minute[0] != "0" && int.parse(minute) < 10) {
        minute = "0" + minute;
      }

      save();
    } else {
      print("not validated");
    }
  }

  save() async {
    print(time);
    int i = await DatabaseHelper.instance.insert({
      "day": widget.day,
      "subject": Subject,
      "url": url,
      "hour": int.parse(hour),
      "minute": int.parse(minute),
      "meridian": meridian
    });
    print(i);
    Navigator.pop(context, true);
  }
}
