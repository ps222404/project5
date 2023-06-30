import 'package:flutter/material.dart';
import 'package:project5mobile/pages/Inloggen/LoginPage.dart';
import 'package:project5mobile/service/Inlogservice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) {
    final authToken = UserData.authToken ?? '';
    InlogService.logout(authToken, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'lib/assets/oefeningen.jpg',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
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
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Handle register button press
                            },
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    SizedBox(height: 10),
                    if (UserData.authToken != null)
                      TextButton(
                        onPressed: () {
                          logout(context);
                        },
                        child: Text('Logout'),
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
