import 'dart:convert';
import 'dart:io';

readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = jsonDecode(input);
  return map;
}

void main() async {
  List quran1 = await readJsonFile(
      "C:\\flutter_project\\quran_bshr_abl3\\bin\\final.json");

  List quran2 = await readJsonFile(
      "C:\\flutter_project\\quran_bshr_abl3\\bin\\data\\NeverEditThisFile.json");

  List quran3 = await readJsonFile(
      "C:\\flutter_project\\quran_bshr_abl3\\bin\\data\\newQuran.json");
  int node = 0;

  List<String> codeV1 = [];
  List<String> text = [];

  for (var e in quran2) {
    for (var e2 in e["ayahs"]) {
      if ((e2["words"] as List).isNotEmpty) {
        for (var word in e2["words"]) {
          if (word["text"][0] == "(") {
            word["char_type_name"] = "end";
          } else {
            word["char_type_name"] = "word";
          }

          codeV1.add(word["code_v1"]);
        }
      }
    }
  }
  for (var e in quran1) {
    for (var e1 in (e["pages"])) {
      for (var e2 in e1["ayahs"]) {
        if ((e2["words"] as List).isNotEmpty) {
          for (var word in e2["words"]) {
            if (word["text"][0] == "(") {
              word["type"] = "end";
            } else {
              word["type"] = "word";
            }

            word["c_v1"] = codeV1.first;
            codeV1.removeAt(0);
          }
        }
      }
    }
  }
  node = 0;
  for (var e in quran3[1]) {
    for (var e1 in e["c"]) {
      if (!(e1["c"] is List)) {
        node++;
        text.add(e1["c"]);
      }
    }
  }

  print(node);

  node = 0;

  for (var e in quran1) {
    for (var e1 in (e["pages"])) {
      for (var e2 in e1["ayahs"]) {
        if ((e2["words"] as List).isNotEmpty) {
          for (var word in e2["words"]) {
            node++;
            word["text"] = text.first;
            text.removeAt(0);
          }
        }
      }
    }
  }
  print(node);
  var file = File("C:\\flutter_project\\quran_bshr_abl3\\bin\\final2.json");
  await file.writeAsString(jsonEncode(quran1));
}
