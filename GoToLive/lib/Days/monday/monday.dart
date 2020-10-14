import 'package:GoToLive/Days/monday/update.dart';
import 'package:GoToLive/database/db.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'input.dart';

class Monday extends StatefulWidget {
  final String title;
  final String query;

  const Monday({Key key, this.title, this.query}) : super(key: key);
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  var minuteString = "";
  var hourString = "";
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = DatabaseHelper.instance.query(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        brightness: Brightness.light,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.grey[600],
            Colors.grey[700],
          ])),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.juliusSansOne(fontSize: 35),
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
                builder: (context) => InputForm(day: widget.query),
              ));
          setState(() {
            if (result == true) {
              future = DatabaseHelper.instance.query(widget.query);
            }
            print(result);
          });
        },
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tap the",
                style: TextStyle(color: Colors.black26, fontSize: 15),
              ),
              Icon(
                Icons.add,
                size: 18,
                color: Colors.black45,
              ),
              Text(
                "button to add subjects",
                style: TextStyle(color: Colors.black26, fontSize: 15),
              )
            ],
          ),
        ),
        FutureBuilder(
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
                  if (snapshot.data[index]['hour'] > 12) {
                    hourString = (snapshot.data[index]['hour'] - 12).toString();
                  } else {
                    hourString = snapshot.data[index]['hour'].toString();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                                    snapshot.data[index]['subject']
                                            .toString()[0]
                                            .toUpperCase() +
                                        snapshot.data[index]['subject']
                                            .toString()
                                            .substring(1),
                                    style: GoogleFonts.amiri(
                                      fontSize: 30,
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
                                    height: 30,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Text(
                                        hourString +
                                            ':' +
                                            minuteString +
                                            " " +
                                            snapshot.data[index]['meridian'],
                                        style: GoogleFonts.rubik(
                                            fontSize: 16, color: Colors.white)),
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
                                            .query(widget.query);
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
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Verify that you entered a valid url"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "Make sure that you added https:// or http:// in your url")
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  color: Colors.grey,
                                  child: Text("Join Class"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
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
      ]),
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
                    future = DatabaseHelper.instance.query(widget.query);
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
