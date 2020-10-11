import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String timeText = "";
  var meridian = "am";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Card(
            color: Colors.grey[200],
            elevation: 10,
            child: Column(
              children: [
                Form(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: TextFormField(
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
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  maxLength: 2,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 15),
                                    counterText: "",
                                    border: OutlineInputBorder(),
                                  ),
                                )),
                                Flexible(
                                    child: Text(
                                  ":",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                    child: TextFormField(
                                  maxLength: 2,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: EdgeInsets.only(left: 15),
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
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              ),
                              onPressed: () {},
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Save",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
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
}
