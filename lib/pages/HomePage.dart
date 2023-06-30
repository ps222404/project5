import 'package:flutter/material.dart';
import 'package:project5mobile/pages/about_us/aboutUs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 100.0), // Pas de waarde hier aan
                child: Text('Home'),
              ),
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );
                  }
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
                  'Home',
                  style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
