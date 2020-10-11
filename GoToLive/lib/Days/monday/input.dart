import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String timeText = "";
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
                          vertical: 20.0, horizontal: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(timeText),
                        RaisedButton.icon(
                            onPressed: () {
                              timePicker(context);
                            },
                            icon: Icon(
                              Icons.alarm,
                              color: Colors.red,
                            ),
                            label: Text("SET"))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () {},
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future timePicker(BuildContext context) async {
    TimeOfDay initial = TimeOfDay.now();
    TimeOfDay time;
    var hour = "";
    var meridean = "";
    var minute = "";

    time = await showTimePicker(
        builder: (context, child) => Theme(
              data: ThemeData.dark(),
              child: child,
            ),
        context: context,
        initialTime: initial);
    if (time != null) {
      if (time.hour == 0) {
        hour = "12";
        meridean = "am";
      } else if (time.hour == 12) {
        hour = "12";
        meridean = "pm";
      } else if (time.hour > 12) {
        hour = (time.hour - 12).toString();
        meridean = "pm";
      } else {
        hour = time.hour.toString();
        meridean = "am";
      }
      if (time.minute < 10) {
        minute = "0" + time.minute.toString();
      } else {
        minute = time.minute.toString();
      }

      setState(() {
        timeText = hour + "  : " + minute + " $meridean ";
      });
    }
  }
}
