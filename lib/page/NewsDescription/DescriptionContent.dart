import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../Model/News.dart';

class DescriptionContent extends StatelessWidget {
  int index = 0;
  DescriptionContent({required this.index});
  @override
  Widget build(BuildContext context) {
    News news = Provider.of<News>(context);
    List<Artical> list = news.articals_list;
    Artical artical = list[index];
    var description = Text("${artical.discription}",
        style: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(186, 186, 186, 1),
          fontWeight: FontWeight.w400,
        ));
    var sourceAndDate = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "${artical.source}",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: Color.fromRGBO(242, 242, 242, 1)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${artical.publishedAt}",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color.fromRGBO(242, 242, 242, 1)),
        ),
      ],
    );
    var titile = Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Text(
        "${artical.title}",
        style: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(186, 186, 186, 1),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titile,
          SizedBox(
            height: 55,
          ),
          sourceAndDate,
          SizedBox(
            height: 16,
          ),
          description
        ],
      ),
    );
  }
}
