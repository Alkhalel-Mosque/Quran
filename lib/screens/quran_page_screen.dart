import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/models/juz.dart';
import 'package:quran/models/line.dart';
import 'package:quran/models/word.dart';

class QuranScreen extends StatelessWidget {
  final Juz juz;
  const QuranScreen({
    Key? key,
    required this.juz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 221, 220, 215),
              Color.fromARGB(255, 255, 255, 253),
              Color.fromARGB(255, 221, 220, 215),
            ],
          ),
        ),
        child: SafeArea(
          child: PageView.builder(
            reverse: true,
            itemCount: juz.pages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("الجزء الأول",
                              style: GoogleFonts.scheherazadeNew()),
                          Text("سُورَةُ ٱلْفَاتِحَةِ",
                              style: GoogleFonts.scheherazadeNew()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: juz.pages[index].lines.map(
                          (line) {
                            if (line is NormalLine) {
                              return SizedBox(
                                width: double.infinity,
                                height: max(h, w) / 17,
                                child: FittedBox(
                                  // fit: BoxFit.fill,
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily:
                                            'page${juz.pages[index].id}',
                                        fontSize: 100,
                                        height: 0,
                                        letterSpacing: 2,
                                        color: Colors.black,
                                      ),
                                      children: line.words.map(
                                        (word) {
                                          if (word is NormalWord) {
                                            return TextSpan(text: word.codeV1);
                                          } else {
                                            word as EndWord;
                                            return TextSpan(text: word.codeV1);
                                          }
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                              );
                            } else if (line is SurahNameLine) {
                              return SizedBox(
                                height: max(h, w) / 17,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/surah_header.png"))),
                                  child: Center(
                                    child: Text("سورة ${line.surahName}",
                                        style: GoogleFonts.scheherazadeNew()),
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: max(h, w) / 17,
                                width: double.infinity,
                                child: const FittedBox(
                                  // fit: BoxFit.fill,
                                  child: Text(
                                    BasmalehLine.basmaleh,
                                    style: TextStyle(
                                      fontFamily: 'basmaleh',
                                      fontSize: 20,
                                      height: 2,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ).toList(),
                      ),
                    ), //comment
                    Text(numberToIndian(juz.pages[index].id.toString()),
                        style: GoogleFonts.scheherazadeNew()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

String numberToIndian(String x) {
  String result;
  switch (x) {
    case "0":
      result = "٠";
      break;
    case "1":
      result = "١";
      break;
    case "2":
      result = "٢";
      break;
    case "3":
      result = "٣";
      break;
    case "4":
      result = "٤";
      break;
    case "5":
      result = "٥";
      break;
    case "6":
      result = "٦";
      break;
    case "7":
      result = "٧";
      break;
    case "8":
      result = "٨";
      break;
    case "9":
      result = "٩";
      break;
    default:
      result = "٠";
  }
  return result;
}
