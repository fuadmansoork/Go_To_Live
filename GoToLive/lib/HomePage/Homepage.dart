import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void inToMainApp(BuildContext context) {
    Navigator.of(context).pushNamed('/days');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => inToMainApp(context),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Image.asset('assets/img/logo_b.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: FloatingActionButton(
                  onPressed: () => inToMainApp(context),
                  child: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Color(0xFF1E88E5),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ]),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.cyan,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
