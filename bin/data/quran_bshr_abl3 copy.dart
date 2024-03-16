import 'dart:convert';
import 'dart:developer';
import 'dart:io';

readJsonFile(String filePath) async {
  var input = await File(filePath).readAsString();
  var map = jsonDecode(input);
  return map;
}

void main() async {
  var list1 = [];

  var list2 = [];

  List quran1 = await readJsonFile(
      "C:\\flutter_project\\quran_bshr_abl3\\bin\\quran1.json");

  List quran2 = await readJsonFile(
      "C:\\flutter_project\\quran_bshr_abl3\\bin\\quran2.json");

  int node = 0;

  for (var e in (quran2[1] as List)) {
    for (var e2 in (e["c"] as List)) {
      if (e2["t"] != "Space") {
        list2.add(e2["c"]);
        // print(e2["c"]);
        node++;
      }
    }
  }
  print(node);

  node = 0;
  for (var e in quran1) {
    for (var e2 in (e["ayahs"] as List)) {
      if (e2["metaData"]["lineType"] == null) {
        for (var e3 in e2["words"]) {
          e3["text"] = list2[node];
          node++;
        }
      }
    }
  }
  var file = File("C:\\flutter_project\\quran_bshr_abl3\\bin\\test.JSON");
  await file.writeAsString(jsonEncode(quran1));
  // for (var i = 0; i < 83665; i++) {
  //   print(" $i list1 : ${list1[i]} | list2 : ${list2[i]}");
  // }
  print(node);
}
