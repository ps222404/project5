import 'package:flutter/material.dart';
import 'package:project5mobile/pages/about_us/aboutUs.dart';

class Prestaties extends StatelessWidget {
  const Prestaties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Text('Mijn App'),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/wallpaper.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(50),
              color: Colors.white70,
              child: Text(
                'prestaties',
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
