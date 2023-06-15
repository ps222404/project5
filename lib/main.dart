import 'package:flutter/material.dart';
import 'package:project5mobile/pages/HomePage.dart';
import 'package:project5mobile/pages/Oefeningen/Oefeningen.dart';
import 'package:project5mobile/pages/Prestaties/Prestaties.dart';


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
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.blue,
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.accessibility_new_rounded)),
                Tab(icon: Icon(Icons.hourglass_top)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomePage(),
              Oefeningen(),
              Prestaties(),
            ],
          ),
        ),
      ),
    );
  }
}