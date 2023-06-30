import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project5mobile/main.dart';
import 'package:flutter/material.dart';
class UserData {
  static int? userId;
  static String? authToken;
  static String? userEmail;
}
class InlogService {
  static Future<void> login(BuildContext context, String email, String password) async {
    try {
      final url = 'http://127.0.0.1:8000/api/login';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        UserData.authToken = data['access_token'];
        UserData.userEmail = email;
        UserData.userId = data['user']['id'];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Exercise()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('login failed'),
                content: Text('try again'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('Error'),
              content: Text('connection error'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }

  }
  static Future<void> logout(String token, BuildContext context) async {
    try {
      final url = 'http://127.0.0.1:8000/api/logout';
      // Make the API request to log out
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Successful logout
        print('Logout successful');
        UserData.authToken = null;
        UserData.userEmail = null;
        UserData.userId = null;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Exercise()),
        );
      } else {
        // Error during logout
        print('Logout error');
      }
    } catch (e) {
      // Exception occurred
      print('Error occurred: $e');
    }
  }
}