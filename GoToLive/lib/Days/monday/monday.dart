import 'package:GoToLive/Days/monday/update.dart';
import 'package:GoToLive/database/db.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data[index]['subject'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                snapshot.data[index]['time'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Row(
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
                                    future =
                                        DatabaseHelper.instance.query("monday");
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
