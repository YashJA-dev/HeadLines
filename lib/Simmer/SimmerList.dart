import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'SImmerTile.dart';

class SimmerList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(70, 70, 70, 1)),

          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext, int)=>ShimmerTile(),
          ),
        ),
      ),
    ); 
  }
}