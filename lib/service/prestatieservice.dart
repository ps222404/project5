import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project5mobile/models/Prestatie.dart';
import 'package:project5mobile/service/Inlogservice.dart';

class PrestatieService {
  final token = UserData.authToken;
  final id = UserData.userId;
  Future<List<Prestatie>> getAll() async {
    final response = await http.get(Uri.parse('http://192.168.2.26:8000/api/showprestaties/$id'),
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
}
