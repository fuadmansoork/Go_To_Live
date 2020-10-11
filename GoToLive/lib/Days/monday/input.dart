import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
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
                        Text("00 : 00 am"),
                        RaisedButton.icon(
                            onPressed: () {},
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
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
