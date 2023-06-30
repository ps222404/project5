import 'package:flutter/material.dart';




class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Welcome to our app! We are a dedicated team of developers who strive to create amazing experiences for our users.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact us:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: info@example.com',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Phone: +1 123-456-7890',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




