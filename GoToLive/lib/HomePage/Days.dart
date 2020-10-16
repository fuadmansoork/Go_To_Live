import 'package:GoToLive/Days/monday/monday.dart';
import 'package:flutter/material.dart';

class Days extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.red,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Monday(
                          title: "Monday",
                          query: "monday",
                        ),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.teal[400], Colors.teal[800]]),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text(
                    "MONDAY",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Monday(
                          title: "Tuesday",
                          query: "tuesday",
                        ),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.teal[400], Colors.teal[800]]),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text(
                    "TUESDAY",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Monday(
                          title: "Wednesday",
                          query: "wednesday",
                        ),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.teal[400], Colors.teal[800]]),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text("WEDNESDAY",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Monday(
                          title: "Thursday",
                          query: "thursday",
                        ),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.teal[400], Colors.teal[800]]),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text("THURSDAY",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Monday(
                          title: "Friday",
                          query: "friday",
                        ),
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.teal[400], Colors.teal[800]]),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text("FRIDAY",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
