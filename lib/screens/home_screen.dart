import 'package:flutter/material.dart';
import 'package:quran/main.dart';
import 'package:quran/screens/quran_page_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("القران الكريم"),
      ),
      body: ListView.builder(
        itemCount: quran.juzs.length,
        itemBuilder: (context, index) => ListTile(
          title: Text("الجزء ${quran.juzs[index].juzId}"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuranScreen(
                juz: quran.juzs[index],
              ),
            ));
          },
        ),
      ),
    );
  }
}
