import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Monday extends StatefulWidget {
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
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
    );
  }
}
