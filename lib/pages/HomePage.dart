import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
