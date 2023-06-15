import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project5mobile/models/Oefening.dart';

class OefeningService {
  Future<List<Oefening>> getAll() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/oefeningen'));
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch oefeningen (${response.statusCode}).');
    }

    final List<dynamic> data = jsonDecode(response.body);

    List<Oefening> oefeningen = [];
    for (int i = 0; i < data.length; i++) {
      final oefening = Oefening.fromJson(data[i]);
      oefeningen.add(oefening);
    }

    return oefeningen;
  }
}