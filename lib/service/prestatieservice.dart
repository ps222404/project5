import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project5mobile/models/Prestatie.dart';
import 'package:project5mobile/service/Inlogservice.dart';
import 'package:project5mobile/pages/Prestaties/Prestaties.dart';
import 'package:intl/intl.dart';
class PrestatieService {
  final token = UserData.authToken;
  final id = UserData.userId;
  Future<List<Prestatie>> getAll() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/showprestaties/$id'),
      headers: {
      'Authorization': 'Bearer $token',
    },);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch prestaties (${response.statusCode}).');
    }

    final List<dynamic> data = jsonDecode(response.body);

    List<Prestatie> prestaties = [];
    for (int i = 0; i < data.length; i++) {
      final prestatie = Prestatie.fromJson(data[i]);

      prestaties.add(prestatie);
    }

    return prestaties;
  }


  static void post(int id, int aantal, String time, BuildContext context) async {
    final token = UserData.authToken;
    final userid = UserData.userId;

    final date = DateTime.now();
    final dateFormat = DateFormat('yyyy-MM-dd');
    final date2 = dateFormat.format(date);
    try {
      //
      //final response = await http.post(
      // Uri.parse('http://127.0.0.1:8000/api/prestaties'),
      //  headers: {
      //    'Content-Type': 'application/json',
      //    'Authorization': 'Bearer $token',
    //  },
      //   body: json.encode({

      //     }),
      //    );
      //   print(response.body);
      final url = 'http://127.0.0.1:8000/api/prestaties';

      final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({
            'oefening_id': id,
            'amount': aantal,
            'date': date2,
            'time': time,
            'user_id': userid,
          }),
      );
      print(response.body);
      if (response.statusCode == 201) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Prestaties()),
        );
        print('Data posted successfully');
      } else {
        // Error occurred during POST request
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred during POST request
      print('Exception: $e');
    }
  }
}
