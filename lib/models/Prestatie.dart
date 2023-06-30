import 'package:flutter/material.dart';
import 'dart:convert';
import 'Oefening.dart';

class Prestatie {
  final int oefeningId;
  final int amount;
  final String date;
  final String time;


  Prestatie({
    required this.oefeningId,
    required this.amount,
    required this.date,
    required this.time,
  });

  factory Prestatie.fromJson(Map<String, dynamic> json) {
    return Prestatie(
      oefeningId: json['oefening_id'],
      amount: json['amount'],
      date: json['date'],
      time: json['time'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'oefening_id': oefeningId,
      'amount': amount,
      'date': date,
      'time': time,

    };
  }
}
