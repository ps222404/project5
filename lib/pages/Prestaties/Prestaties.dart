import 'package:flutter/material.dart';

class Prestaties extends StatelessWidget {
  const Prestaties({super.key});

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
                  'prestaties',
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
