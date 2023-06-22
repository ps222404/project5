import 'package:flutter/material.dart';
import 'package:project5mobile/pages/HomePage.dart';
import 'package:project5mobile/pages/Oefeningen/Oefeningen.dart';
import 'package:project5mobile/pages/Prestaties/Prestaties.dart';
import 'package:project5mobile/service/Inlogservice.dart';


void main() {
  runApp(const Exercise());
}

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: UserData.authToken != null ? 3 : 2,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.blue,
            child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.accessibility_new_rounded)),
                if (UserData.authToken != null) Tab(icon: Icon(Icons.hourglass_top)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              Oefeningen(),
              if (UserData.authToken != null) Prestaties(),
            ],
          ),
        ),
      ),
    );
  }
}