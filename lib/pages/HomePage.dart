import 'package:flutter/material.dart';
import 'package:project5mobile/pages/Inloggen/LoginPage.dart';
import 'package:project5mobile/service/Inlogservice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  Widget build(BuildContext context) {
    void  logout(){
      final authToken = UserData.authToken ?? '';
      InlogService.logout(authToken, context);
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'lib/assets/wallpaper.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black12,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 20),
                    if (UserData.authToken == null)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Login'),
                      ),
                    if (UserData.authToken == null)
                    SizedBox(height: 10),
                    if (UserData.authToken == null)
                    ElevatedButton(
                      onPressed: () {
                        // Handle register button press
                      },
                      child: Text('Register'),
                    ),
                    SizedBox(height: 10),
                    if (UserData.authToken != null)
                      ElevatedButton(
                        onPressed: () {
                           logout();
                        },
                        child: Text('logout'),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
