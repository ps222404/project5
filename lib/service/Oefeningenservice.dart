import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project5mobile/models/Oefening.dart';

class OefeningService {
  Future<List<Oefening>> getAll() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/indexnl'));
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

  Future<Oefening> getById(int oefeningId) async {
    final id = oefeningId;
    final url = 'http://127.0.0.1:8000/api/shownl/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      if (data.isEmpty) {
        throw Exception('No oefening found with ID $oefeningId.');
      }
      final Map<String, dynamic> oefeningData = data.first;
      final oefening = Oefening.fromJson(oefeningData);
      return oefening;

    } else {
      throw Exception('Failed to fetch oefening with ID $oefeningId.');
    }
  }
}