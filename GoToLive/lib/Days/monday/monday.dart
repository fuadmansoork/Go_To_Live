import 'package:GoToLive/Days/monday/update.dart';
import 'package:GoToLive/database/db.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'input.dart';

class Monday extends StatefulWidget {
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  var minuteString = "";

  var future = DatabaseHelper.instance.query("monday");
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.grey[600],
            Colors.grey[700],
          ])),
        ),
        centerTitle: true,
        title: Text(
          arguments['title'],
          style: GoogleFonts.architectsDaughter(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 30,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  LinearGradient(colors: [Colors.grey[700], Colors.grey[500]])),
        ),
        onPressed: () async {
          bool result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputForm(),
              ));
          setState(() {
            if (result == true) {
              future = DatabaseHelper.instance.query("monday");
            }
            print(result);
          });
        },
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) {
                if (snapshot.data[index]['minute'] < 10) {
                  minuteString =
                      "0" + snapshot.data[index]['minute'].toString();
                } else {
                  minuteString = snapshot.data[index]['minute'].toString();
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shadowColor: Colors.grey[800],
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 9,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.teal[800],
                                Colors.teal[600],
                                Colors.teal[400]
                              ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  snapshot.data[index]['subject'],
                                  style: GoogleFonts.amiri(
                                    fontSize: 24,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red[400],
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8),
                                  child: Text(
                                      snapshot.data[index]['hour'].toString() +
                                          ':' +
                                          minuteString +
                                          " " +
                                          snapshot.data[index]['meridian'],
                                      style: GoogleFonts.rubik(
                                          fontSize: 18, color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  bool result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateForm(
                                            data: snapshot.data[index]),
                                      ));
                                  if (result == true) {
                                    setState(() {
                                      future = DatabaseHelper.instance
                                          .query("monday");
                                    });
                                  }
                                },
                              ),
                              RaisedButton(
                                onPressed: () async {
                                  final url = snapshot.data[index]['url'];
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("OK"))
                                        ],
                                        title: Text(
                                          "Unable to launch URL",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        content: Text(
                                            "Verify that you entered a valid url"),
                                      ),
                                    );
                                  }
                                },
                                child: Text("Join Class"),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  delete(context, snapshot.data[index]['id']);
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future delete(BuildContext context, int id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm delete", style: TextStyle(color: Colors.red)),
          content: Text("Are you sure want to delete this subject ?"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No")),
            FlatButton(
                onPressed: () async {
                  await DatabaseHelper.instance.delete(id);
                  setState(() {
                    future = DatabaseHelper.instance.query("monday");
                  });
                  Navigator.pop(context);
                },
                child: Text("yes"))
          ],
        );
      },
    );
  }
}
