import 'package:flutter/material.dart';
import 'dart:convert';

class Prestatie {
  final int oefeningId;
  final int amount;
  final DateTime date;
  final TimeOfDay start;
  final TimeOfDay end;

  Prestatie({
    required this.oefeningId,
    required this.amount,
    required this.date,
    required this.start,
    required this.end,
  });

  factory Prestatie.fromJson(Map<String, dynamic> json) {
    return Prestatie(
      oefeningId: json['oefening_id'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      start: TimeOfDay(
        hour: int.parse(json['start'].split(':')[0]),
        minute: int.parse(json['start'].split(':')[1]),
      ),
      end: TimeOfDay(
        hour: int.parse(json['end'].split(':')[0]),
        minute: int.parse(json['end'].split(':')[1]),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'oefening_id': oefeningId,
      'amount': amount,
      'date': date.toIso8601String(),
      'start': '${start.hour}:${start.minute}',
      'end': '${end.hour}:${end.minute}',
    };
  }
}