import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/models/juz.dart';

class Quran {
  final List<Juz> juzs;

  const Quran({
    required this.juzs,
  });
  factory Quran.fromJson(List json) {
    return Quran(
      juzs: json.map((e) => Juz.fromJson(e)).toList(),
    );
  }
}

dynamic loadJson() async {
  String data = await rootBundle.loadString('assets/json/quran.json');
  return jsonDecode(data);
}

Future<Quran> getToQuran() async {
  return Quran.fromJson(await loadJson());
}
