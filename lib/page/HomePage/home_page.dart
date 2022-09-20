import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/Model/News.dart';

import 'NewsListBuilder/NewsListBuilder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HEADLINE"),
        backgroundColor: Colors.black,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 29,
          fontFamily: "Roboto Slab",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: NewsListBuilder(),
    );    
  }
}