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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: PageView.builder(
            reverse: true,
            itemCount: juz.pages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: juz.pages[index].lines.map((line) {
                          if (line is NormalLine) {
                            return FittedBox(
                              child: RichText(
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'page${juz.pages[index].id}',
                                      fontSize: 100,
                                      height: 0,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                    ),
                                    children: line.words.map((word) {
                                      if (word is NormalWord) {
                                        return TextSpan(text: word.codeV1);
                                      } else {
                                        word as EndWord;
                                        return TextSpan(text: word.codeV1);
                                      }
                                    }).toList()),
                              ),
                            );
                          } else if (line is SurahNameLine) {
                            return Text(line.surahName);
                          } else {
                            return const Text(BasmalehLine.basmaleh);
                          }
                        }).toList(),
                      ),
                    ),
                    Text(juz.pages[index].id.toString()),
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
