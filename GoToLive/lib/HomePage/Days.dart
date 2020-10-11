import 'package:flutter/material.dart';

class Days extends StatelessWidget {
  const Days({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Column(
        children: [
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Wrap(
                alignment: WrapAlignment.end,
                spacing: 50,
                runSpacing: 50,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/monday', arguments: {'title': "Monday"});
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 80, right: 100, left: 100),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(300),
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ]),
                          ),
                          child: Center(
                              child: Text('MON',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/tuesday', arguments: {'title': "Thesday"});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(300),
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF42A5F5),
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                            ]),
                          ),
                          child: Center(
                              child: Text('TEU',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/wednesday');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(300),
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ]),
                          ),
                          child: Center(
                              child: Text('WED',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/thursday');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(300),
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF42A5F5),
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                            ]),
                          ),
                          child: Center(
                              child: Text('THU',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/friday');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(300),
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ]),
                          ),
                          child: Center(
                              child: Text('FRI',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)))),
                    ),
                  ),
                ]),
          ])
        ],
      )
    ])));
  }
}
