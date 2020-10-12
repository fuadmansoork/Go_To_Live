import 'package:GoToLive/database/db.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UpdateForm extends StatefulWidget {
  final Map data;

  const UpdateForm({Key key, this.data}) : super(key: key);

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  String timeText = "";
  var meridian = "am";
  var _formKey = GlobalKey<FormState>();

  var subjectController = TextEditingController(text: 'subject');
  var linkController = TextEditingController(text: 'url');
  var hourController = TextEditingController();
  var minuteController = TextEditingController();
  var Subject = "";
  String url = "";
  String day = "monday";
  var hour = "";
  var minute = "";
  var time = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Subject = widget.data['subject'];
    url = widget.data['url'];
    time = widget.data['time'];
    hour = time[0] + time[1];
    minute = time[5] + time[6];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Card(
            color: Colors.grey[200],
            elevation: 10,
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: TextFormField(
                              initialValue: widget.data['subject'],
                              onChanged: (value) {
                                Subject = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter a subject name";
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: TextFormField(
                              initialValue: widget.data['url'],
                              onChanged: (value) {
                                url = value;
                                print(url);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "This field is required";
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      initialValue: widget.data['time'][0] +
                                          widget.data['time'][1],
                                      onChanged: (value) {
                                        hour = value;
                                      },
                                      keyboardType: TextInputType.datetime,
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
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    Expanded(
                                        child: TextFormField(
                                      initialValue: widget.data['time'][5] +
                                          widget.data['time'][6],
                                      keyboardType: TextInputType.datetime,
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
                                  activeBgColor: Colors.red,
                                  cornerRadius: 12,
                                  changeOnTap: true,
                                  minWidth: 45,
                                  initialLabelIndex: 0,
                                  labels: ["am", "pm"],
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    "Update",
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

      time = hour + " : " + minute + meridian;
      save();
    } else {
      print("not validated");
    }
  }

  save() async {
    print(Subject);
    int i = await DatabaseHelper.instance.update({
      "day": day,
      "subject": Subject,
      "url": url,
      "time": time,
      "id": widget.data['id']
    });
    print(i);
    Navigator.pop(context, true);
  }
}
