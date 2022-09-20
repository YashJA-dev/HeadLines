import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/Controller/NewsFetcher.dart';
import 'package:task_flutter/Simmer/SimmerList.dart';

import 'Model/News.dart';
import 'page/HomePage/home_page.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsFetcher().getArticals(),
      builder: ((context, snapshot) {
        News news = News.verdict(staus: "No");
        if (snapshot.hasData) {
          return ChangeNotifierProvider(
            create: (context) => snapshot.data as News,
            child: MaterialApp(
              theme: ThemeData(
                fontFamily: "Roboto Slab",
              ),
              home: HomePage(),
            ),
          );
        } else {
          return SimmerList();
        }
      }),
    );
  }
}
