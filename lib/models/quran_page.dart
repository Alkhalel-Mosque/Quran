import 'package:quran/models/line.dart';

class QuranPage {
  final int id;
  final List<Line> lines;

  const QuranPage({
    required this.id,
    required this.lines,
  });
  factory QuranPage.fromJson(Map json) {
    return QuranPage(
      id: json["page"],
      lines: (json["ayahs"] as List).map((e) => Line.fromJson(e)).toList(),
    );
  }
}
